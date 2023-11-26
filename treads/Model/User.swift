//
//  User.swift
//  treads
//
//  Created by Agustin Carbajal on 25/11/2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
