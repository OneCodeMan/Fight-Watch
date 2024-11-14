//
//  Fight_WatchApp.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-10.
//

import SwiftUI
import GoogleMobileAds
import Foundation

@main
struct Fight_WatchApp: App {
    
    @StateObject private var adViewModel = InterstitialViewModel()
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "d45f40428ec9a4923f03531e3846d3c2" ]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(adViewModel)
        }
    }
}
