//
//  Event.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import Foundation

struct Event: Decodable, Hashable {
    
    // Hashable
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.organization == rhs.organization &&
        lhs.title == rhs.title &&
        lhs.date == rhs.date &&
        lhs.location == rhs.location &&
        lhs.eventURL == rhs.eventURL
    }
    
    var organization: String
    var title: String
    var date: String
    var location: String
    var eventURL: String
    var fights: [Fight]
    
    enum CodingKeys: String, CodingKey {
        case organization
        case title
        case date
        case location
        case eventURL = "event_url"
        case fights
    }
}
