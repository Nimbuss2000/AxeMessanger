//
//  CircularProfileImageView.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 05.06.2024.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var demension: CGFloat {
        switch self {
        case.xxSmall: return 28
        case.xSmall: return 32
        case.small: return 40
        case.medium: return 56
        case.large: return 64
        case.xLarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: size.demension, height: size.demension)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(Color(.systemGray4))
                .frame(width: size.demension, height: size.demension)
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USER, size: .medium)
}
