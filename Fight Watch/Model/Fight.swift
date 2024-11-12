//
//  Fight.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import Foundation

struct Fight: Decodable, Hashable {
    
    static func == (lhs: Fight, rhs: Fight) -> Bool {
        lhs.id == rhs.id &&
        lhs.fighterOne == rhs.fighterOne &&
        lhs.fighterTwo == rhs.fighterTwo &&
        lhs.weight == rhs.weight
    }
    
    var id: UUID?
    var fighterOne: Fighter
    var fighterTwo: Fighter
    var weight: String
    
    init(id: UUID = UUID(), fighterOne: Fighter, fighterTwo: Fighter, weight: String) {
        self.id = id
        self.fighterOne = fighterOne
        self.fighterTwo = fighterTwo
        self.weight = weight
    }
    
    enum CodingKeys: String, CodingKey {
        case fighterOne = "fighter_one"
        case fighterTwo = "fighter_two"
        case weight
    }
}
