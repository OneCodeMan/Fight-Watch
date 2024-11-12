//
//  DataLoader.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-12.
//

import Foundation

typealias MMAEvents = [FightEvent]

final class FightWatchService: ObservableObject {
    
    private(set) var fightEvents: MMAEvents = []
    static let shared = FightWatchService()
    
    private init() {
        let mmaEvents = self.loadMMAEvents()
        self.fightEvents = mmaEvents
    }
    
    func loadMMAEvents() -> MMAEvents {
        guard let url = Bundle.main.url(forResource: "mma_events", withExtension: "json") else {
                print("Failed to locate mma_events.json in bundle.")
                return []
            }
        do {
            let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let mmaEvents = try decoder.decode(MMAEvents.self, from: data)
                    return mmaEvents
        } catch {
            print("Failed to decode mma_events.json: \(error)")
                    return []
        }
    }
}
