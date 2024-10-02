//
//  SettingsOptionsViewModel.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 05.06.2024.
//

import SwiftUI


enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    case accsessibility
    case privacy
    case notifications
    
    var title: String {
        switch self {
        case.darkMode: return "Dark Mode"
        case.activeStatus: return "Active Status"
        case.accsessibility: return "Accessibiblity"
        case.privacy: return "Privacy"
        case.notifications: return "Notifications"
        }
    }
    
    var imageName: String {
        switch self {
        case.darkMode: return "moon.circle.fill"
        case.activeStatus: return "message.circle.fill"
        case.accsessibility: return "person.circle.fill"
        case.privacy: return "lock.circle.fill"
        case.notifications: return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case.darkMode: return .black
        case.activeStatus: return Color(.systemGreen)
        case.accsessibility: return .black
        case.privacy: return Color(.systemBlue)
        case.notifications: return Color(.systemPurple)
        }
    }
    
    var id: Int {return self.rawValue}
}

