//
//  CurrentUserProfileView.swift
//  treads
//
//  Created by Agustin Carbajal on 04/12/2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                    Button{
                        showEditProfile.toggle()
                    }label: {
                        Text("Edit profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray3), lineWidth:1)
                            }
                    }
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                }
                .sheet(isPresented: $showEditProfile, content: {
                    if let user = currentUser {
                        EditProfileView(user: user)
                            .environmentObject(viewModel)
                    }
                })
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
