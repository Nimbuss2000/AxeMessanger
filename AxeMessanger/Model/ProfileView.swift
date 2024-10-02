//
//  ProfileVoew.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 04.06.2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $viewModel.selectedItem) {
                if let profileImage = viewModel.profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                } else {
                    CircularProfileImageView(user: user, size: .xLarge)
                }
            }
            
            Text(user.fullname)
                .font(.title2)
                .fontWeight(.semibold)
            
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                }
                
                Section {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Text("Log Out")
                    }
                    
                    Button {
                        print("Delete account")
                    } label: {
                        Text("Delete Account")
                    }
                }
                .foregroundColor(.red)
            }
                
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER)
}
