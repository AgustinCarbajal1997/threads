//
//  UserService.swift
//  treads
//
//  Created by Agustin Carbajal on 25/11/2023.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User? // con esto vamos a popular la data del usuario a lo largo de toda la app
    
    static let shared = UserService()
    
    init(){
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    func reset(){
        self.currentUser = nil
    }
}
