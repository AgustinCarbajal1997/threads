//
//  UserCell.swift
//  treads
//
//  Created by Agustin Carbajal on 20/11/2023.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileView()
            VStack(alignment: .leading){
                Text("maxverstappen1")
                    .font(.footnote)
                    .fontWeight(.semibold)

                
                Text("Formula 1 Champion")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray3), lineWidth:1)
                }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
