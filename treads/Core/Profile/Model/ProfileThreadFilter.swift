//
//  ProfileThreadFilter.swift
//  treads
//
//  Created by Agustin Carbajal on 22/11/2023.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads //como pusimos Int Arriba, esto es como decir case threads = 0
    case replies //como pusimos Int Arriba, esto es como decir case replies = 1

    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        
        }
    }
    
    var id: Int {
        return self.rawValue  // esto por que? porque implicitamente el valor es un Int, lo usa como id
    }
}
