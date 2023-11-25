//
//  EditProfileView.swift
//  treads
//
//  Created by Agustin Carbajal on 25/11/2023.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var bio: String = ""
    @State private var link: String = ""
    @State private var isPrivateProfile: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Charles Leclerc")
                        }
                        .font(.footnote)
                        Spacer()
                        CircularProfileView()
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your link...", text: $link)
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                    
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth:1)
                }
                .padding() // notese que pusimos dos padding !!! importante
                
            }
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Done"){
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
