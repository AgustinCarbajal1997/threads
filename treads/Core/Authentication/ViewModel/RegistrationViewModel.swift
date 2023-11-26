//
//  RegistrationViewModel.swift
//  treads
//
//  Created by Agustin Carbajal on 25/11/2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var username: String = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullName,
            username: username
        )
        
    }
    
}
