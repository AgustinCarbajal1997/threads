//
//  LoginViewModel.swift
//  treads
//
//  Created by Agustin Carbajal on 25/11/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
        
    }
    
}
