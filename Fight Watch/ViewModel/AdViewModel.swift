//
//  AdViewModel.swift
//  Fight Watch
//
//  Created by Dave Gumba on 2024-11-11.
//

import Foundation
import GoogleMobileAds

class InterstitialViewModel: NSObject, ObservableObject, GADFullScreenContentDelegate {
    @Published var interstitialAd: GADInterstitialAd?
    
    override init() {
        super.init()
        Task {
            await self.loadAd()
        }
    }
    
    @MainActor
    func loadAd() async {
        do {
            interstitialAd = try await GADInterstitialAd.load(
                withAdUnitID: "ca-app-pub-8518848174079347/3260186830", request: GADRequest())
            interstitialAd?.fullScreenContentDelegate = self
        } catch {
            print("Failed to load interstitial ad with error: \(error.localizedDescription)")
        }
    }
    
    func showAd() async {
        Task {
            DispatchQueue.main.async {
                if let interstitialAd = self.interstitialAd {
                    print("We have ad.")
                    interstitialAd.present(fromRootViewController: nil)
                } else {
                    print("Ad wasn't ready.")
                }
            }
           
        }
      
    }
}
