//
//  User.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 04.06.2024.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
}

extension User {
    static let MOCK_USER = User(fullname: "Bruce Wayne", email: "BMWmail@gmail.com", profileImageUrl: "pika")
}
