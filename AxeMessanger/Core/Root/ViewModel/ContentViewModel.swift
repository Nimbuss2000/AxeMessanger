//
//  ContentViewModel.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 08.07.2024.
//

import Foundation
import Firebase
import Combine


class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
        print("DEBUG: Conten VM: User session - \(userSession?.uid)")
        
//        AuthService.shared.ints = 90
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession
            .sink { [weak self] userSessionFromAuthService in
                self?.userSession = userSessionFromAuthService
            }.store(in: &cancellables)
        
//         AuthService.shared.$ints
//            .sink { [weak self] qwerty in
//                self?.ints = qwerty
//            }
//            .store(in: &cancellables)
    }
}
