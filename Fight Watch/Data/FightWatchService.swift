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
            var mmaEvents = try decoder.decode(MMAEvents.self, from: data)
            
            let currentDate = Date.now
            let twoDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date.now) ?? Date()
            
            mmaEvents = mmaEvents
                .sorted { ($0.eventDate ?? Date.distantPast) < ($1.eventDate ?? Date.distantPast) }
                .filter { ($0.eventDate ?? Date.distantPast) >= twoDaysAgo }
            
            return mmaEvents
        } catch {
        print("Failed to decode mma_events.json: \(error)")
                return []
        }
    }
}
