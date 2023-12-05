//
//  CircularProfileView.swift
//  treads
//
//  Created by Agustin Carbajal on 20/11/2023.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
            
        case .xxSmall:
            return 28
        case .xSmall:
            return 30
        case .small:
            return 36
        case .medium:
            return 40
        case .large:
            return 44
        }
    }
}

struct CircularProfileView: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
        
    }
}

struct CircularProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileView(user: dev.user, size: .medium)
    }
}
