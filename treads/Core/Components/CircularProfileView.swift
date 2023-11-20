//
//  CircularProfileView.swift
//  treads
//
//  Created by Agustin Carbajal on 20/11/2023.
//

import SwiftUI

struct CircularProfileView: View {
    var body: some View {
        Image("max")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

struct CircularProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileView()
    }
}
