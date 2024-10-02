//
//  LoginView.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 05.06.2024.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                
                Image("messanger-icon")
                    .resizable()
                    .scaledToFit()
                    //.aspectRatio(contentMode: .fit)
                    .shadow(radius: 5, x: 5, y: 5)
                    .frame(width: 150, height: 150)
                    .padding()
                    
                VStack(spacing: 12) {
                    TextField("Enter you email", text: $viewModel.email)
                        .font(.headline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    SecureField("Enter you password", text: $viewModel.password)
                        .font(.headline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
                
                Button {
                    print("Forrgot password?")
                } label: {
                    Text("Forrgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task { try await viewModel.login() }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)

                HStack{
                    Image("facebook-icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    
                    Text("Continue with facebook")
                        .font(.footnote)
                        .foregroundColor(Color(.systemBlue))
                        .fontWeight(.semibold)
                }
                .padding(.top, 8)

                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack{
                        Text("Dint't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}
