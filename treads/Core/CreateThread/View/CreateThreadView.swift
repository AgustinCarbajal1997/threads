//
//  CreateThreadView.swift
//  treads
//
//  Created by Agustin Carbajal on 20/11/2023.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    } // esto lo hago pq? pq es una pantalla que está en el tabbar, pero el dato del usuario al abrirse la app puede que no esté, esto por esto hago esto en lugar de let user:User. por lo tanto ya no tengo que pasarle el user a la pantalla
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircularProfileView(user: user, size: .medium)
                    VStack(alignment: .leading, spacing: 4){
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Enter your link...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button{
                            caption = ""
                        }label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Post"){
                        Task { try await viewModel.uploadThread(caption: caption) }
                        dismiss()
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct CreateThreadView_Previews: PreviewProvider {
    static var previews: some View {
        CreateThreadView()
    }
}
