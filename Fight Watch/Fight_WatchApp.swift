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
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "68698775adecd73106b0e0a3c9466087" ]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(adViewModel)
        }
    }
}
