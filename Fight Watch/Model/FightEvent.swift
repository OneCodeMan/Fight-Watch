//
//  Event.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import Foundation

struct FightEvent: Decodable, Hashable {
    
    // Hashable
    static func == (lhs: FightEvent, rhs: FightEvent) -> Bool {
        lhs.id == rhs.id &&
        lhs.organization == rhs.organization &&
        lhs.title == rhs.title &&
        lhs.date == rhs.date &&
        lhs.location == rhs.location &&
        lhs.eventURL == rhs.eventURL
    }
    
    var id = UUID()
    var organization: String
    var title: String
    var date: String
    var location: String
    var daysFromNow: String
    var eventURL: String
    var fights: [Fight]
    
    init(organization: String, title: String, date: String, location: String, daysFromNow: String = "5 days from now", eventURL: String, fights: [Fight]) {
        self.organization = organization
        self.title = title
        self.date = date
        self.location = location
        self.eventURL = eventURL
        self.fights = fights
        
        self.daysFromNow = daysFromNow
    }
    
    enum CodingKeys: String, CodingKey {
        case organization
        case title
        case date
        case location
        case eventURL = "event_url"
        case fights
        case daysFromNow
    }
    
}
