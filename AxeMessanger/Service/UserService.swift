//
//  UserService.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 15.07.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("user").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: Current user in service is \(currentUser)")
    }
}
