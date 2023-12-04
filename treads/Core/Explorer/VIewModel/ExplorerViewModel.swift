//
//  ExplorerViewModel.swift
//  treads
//
//  Created by Agustin Carbajal on 04/12/2023.
//

import Foundation

class ExplorerViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
