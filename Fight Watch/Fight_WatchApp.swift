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
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "2bfafec615547fa2bc6055e2865d1b89" ]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(adViewModel)
        }
    }
}
