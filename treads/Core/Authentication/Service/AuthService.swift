//
//  AuthService.swift
//  treads
//
//  Created by Agustin Carbajal on 25/11/2023.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            print("Entra aca")
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("Error failed:\(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("Error failed:\(error.localizedDescription)") // se puede acceder directamente al error porque swift lo infiere seria lo mismo que poner let error = error
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut() // signout on backend
        self.userSession = nil // remove session locally
        UserService.shared.reset()
    }
    
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    ) async throws{
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else {
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
