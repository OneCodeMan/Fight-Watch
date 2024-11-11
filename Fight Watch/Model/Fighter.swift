//
//  Fighter.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import Foundation

struct Fighter: Decodable, Hashable {
    
    static func == (lhs: Fighter, rhs: Fighter) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.record == rhs.record
    }
    
    var id = UUID()
    
    // "Jon Jones"
    var name: String
    
    // "13-0-1"
    var record: String
}
