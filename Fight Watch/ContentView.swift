//
//  ContentView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-10.
//

import SwiftUI
import AppTrackingTransparency
import AdSupport

struct ContentView: View {
    
    // MARK: App Tracking Transparency
    @AppStorage("trackingStatus") var trackingStatus = "Unknown"
    
    // MARK: Fight Events Store
    @StateObject private var fightEventsStore: FightWatchService = FightWatchService.shared
    
    var body: some View {
        MainView(trackingStatus: $trackingStatus)
    }
}

#Preview {
    ContentView()
}
