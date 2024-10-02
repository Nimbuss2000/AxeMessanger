//
//  RegistrationViewModel.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 05.06.2024.
//

import SwiftUI


class RegistraitionViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
