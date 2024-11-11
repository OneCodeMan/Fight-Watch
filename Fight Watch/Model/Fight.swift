//
//  Fight.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import Foundation

struct Fight: Decodable, Hashable {
    
    static func == (lhs: Fight, rhs: Fight) -> Bool {
        lhs.fighterOne == rhs.fighterOne &&
        lhs.fighterTwo == rhs.fighterTwo &&
        lhs.weight == rhs.weight
    }
    
    var fighterOne: Fighter
    var fighterTwo: Fighter
    var weight: String
}
