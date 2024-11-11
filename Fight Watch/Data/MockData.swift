//
//  MockData.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import Foundation

struct MockData {
    static let mockEvent1: FightEvent = FightEvent(organization: "UFC", title: "UFC 309 - Jones vs. Miocic", date: "Nov 16, 2024", location: "Madison Square Garden, New York, New York, United States", eventURL: "https://www.ufc.com/event/ufc-309", fights: [
        Fight(fighterOne: Fighter(name: "Jon Jones", record: "11-1-0"), fighterTwo: Fighter(name: "Stipe Miocic", record: "28-2"), weight: "Heavyweight"),
        Fight(fighterOne: Fighter(name: "Charles Oliveira", record: "11-1-0"), fighterTwo: Fighter(name: "Michael Chandler", record: "28-2"), weight: "Lightweight"),
        Fight(fighterOne: Fighter(name: "Bo Nickal", record: "11-1-0"), fighterTwo: Fighter(name: "Paul Craig", record: "28-2"), weight: "Middleweight"),
        Fight(fighterOne: Fighter(name: "Viviane Araujo", record: "11-1-0"), fighterTwo: Fighter(name: "Karine Silva", record: "28-2"), weight: "Flyweight"),
        Fight(fighterOne: Fighter(name: "Mauricio Ruffy", record: "11-1-0"), fighterTwo: Fighter(name: "James Llontop", record: "28-2"), weight: "Lightweight"),
        Fight(fighterOne: Fighter(name: "Conor McGregor", record: "11-1-0"), fighterTwo: Fighter(name: "Kamaru Usman", record: "28-2"), weight: "Lightweight"),
        Fight(fighterOne: Fighter(name: "Khabib Nurmagomedov", record: "11-1-0"), fighterTwo: Fighter(name: "Tony Tony Ferguson", record: "28-2"), weight: "Lightweight"),
        Fight(fighterOne: Fighter(name: "Mauricio Ruffy", record: "11-1-0"), fighterTwo: Fighter(name: "James Llontop", record: "28-2"), weight: "Lightweight"),
        Fight(fighterOne: Fighter(name: "Mauricio Ruffy", record: "11-1-0"), fighterTwo: Fighter(name: "James Llontop", record: "28-2"), weight: "Lightweight"),
        Fight(fighterOne: Fighter(name: "Mauricio Ruffy", record: "11-1-0"), fighterTwo: Fighter(name: "James Llontop", record: "28-2"), weight: "Lightweight"),
        Fight(fighterOne: Fighter(name: "Mauricio Ruffy", record: "11-1-0"), fighterTwo: Fighter(name: "James Llontop", record: "28-2"), weight: "Lightweight")
    ])
}
