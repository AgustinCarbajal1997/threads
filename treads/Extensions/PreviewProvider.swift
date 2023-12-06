//
//  PreviewProvider.swift
//  treads
//
//  Created by Agustin Carbajal on 04/12/2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}


class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Lewis Hamilton", email: "lewis@gmail.com", username: "lewishamilton44")
}
