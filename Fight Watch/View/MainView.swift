//
//  MainView.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import SwiftUI
import AppTrackingTransparency
import AdSupport

struct MainView: View {
    
    // MARK: App Tracking
    @Binding var trackingStatus: String
    
    // MARK: Ads
    @EnvironmentObject var adViewModel: InterstitialViewModel

    var body: some View {
        NavigationStack {
            EventListView(events: FightWatchService.shared.fightEvents)
                .environmentObject(adViewModel)
                .onAppear {
                    print("main view appeared")
                    checkTrackingStatus()
                }
        }
        
    }
    
    // MARK: App Tracking Stuff
    func requestTrackingPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                DispatchQueue.main.async {
                    switch status {
                    case .authorized:
                        trackingStatus = "Authorized"
                    case .denied:
                        trackingStatus = "Denied"
                    case .restricted:
                        trackingStatus = "Restricted"
                    case .notDetermined:
                        trackingStatus = "Not Determined"
                    @unknown default:
                        trackingStatus = "Unknown"
                    }
                }
            }
        } else {
            trackingStatus = "Not Available"
        }
    }
        
    func checkTrackingStatus() {
        if #available(iOS 14, *) {
            switch ATTrackingManager.trackingAuthorizationStatus {
            case .authorized:
                trackingStatus = "Authorized"
            case .denied:
                trackingStatus = "Denied"
            case .restricted:
                trackingStatus = "Restricted"
            case .notDetermined:
                trackingStatus = "Not Determined"
            @unknown default:
                trackingStatus = "Unknown"
            }
        } else {
            trackingStatus = "Not Available"
        }
        
        requestTrackingPermission()
    }
}
