//
//  ThreadCell.swift
//  treads
//
//  Created by Agustin Carbajal on 20/11/2023.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileView(user: nil, size: .medium)
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text("maxverstappen10")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Button{}label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    Text("Formula 1 Champion")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    HStack {
                        Button{}label: {
                            Image(systemName: "heart")
                        }
                        Button{}label: {
                            Image(systemName: "bubble.right")
                        }
                        Button{}label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        Button{}label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                    
                }
            }
            Divider()
        }
        .padding()
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell()
    }
}
