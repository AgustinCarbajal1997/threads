//
//  ProfileViewModel.swift
//  treads
//
//  Created by Agustin Carbajal on 25/11/2023.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG User in view model combine in \(user)")
        }.store(in: &cancellables)
    }
}
