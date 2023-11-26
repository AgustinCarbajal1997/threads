//
//  CreateThreadView.swift
//  treads
//
//  Created by Agustin Carbajal on 20/11/2023.
//

import SwiftUI

struct CreateThreadView: View {
    
    @State private var caption: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircularProfileView()
                    VStack(alignment: .leading, spacing: 4){
                        Text("maxverstappen")
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
