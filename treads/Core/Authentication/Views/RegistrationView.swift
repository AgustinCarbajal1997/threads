//
//  RegistrationView.swift
//  treads
//
//  Created by Agustin Carbajal on 19/11/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()

    @Environment(\.dismiss) var dismiss // vuelva a la pantalla anterior
    
    var body: some View {
        VStack {
            Spacer()
            Image("app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifiers())
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifiers())
                
                TextField("Enter your full name", text: $viewModel.fullName)
                    .modifier(ThreadsTextFieldModifiers())
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifiers())
            }
            
            Button{
                Task { try await viewModel.createUser() } 
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
                    
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button{
                dismiss()
            }label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .foregroundColor(.black)
            .padding(.vertical, 16)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
