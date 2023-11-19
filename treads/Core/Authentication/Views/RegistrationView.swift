//
//  RegistrationView.swift
//  treads
//
//  Created by Agustin Carbajal on 19/11/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image("app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifiers())
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifiers())
                
                TextField("Enter your full name", text: $fullName)
                    .modifier(ThreadsTextFieldModifiers())
                
                TextField("Enter your username", text: $username)
                    .modifier(ThreadsTextFieldModifiers())
            }
            
            Button{} label: {
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
            
            Button{}label: {
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
