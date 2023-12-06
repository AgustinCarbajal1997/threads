//
//  ThreadsFieldTextModifiers.swift
//  treads
//
//  Created by Agustin Carbajal on 19/11/2023.
//

import SwiftUI

struct ThreadsTextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 25)
    }
    
}
