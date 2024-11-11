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
    @AppStorage("trackingStatus") var trackingStatus = "Unknown"
    var body: some View {
        MainView(trackingStatus: $trackingStatus)
    }
}

#Preview {
    ContentView()
}
