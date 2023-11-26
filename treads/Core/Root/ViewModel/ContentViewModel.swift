//
//  ContentViewModel.swift
//  treads
//
//  Created by Agustin Carbajal on 25/11/2023.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSuscribers()
    }
    
    private func setupSuscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
