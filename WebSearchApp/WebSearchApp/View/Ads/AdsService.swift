//
//  AdsService.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 02.05.2024.
//

import Foundation
import GoogleMobileAds
import AppTrackingTransparency
import UIKit

class AdsService {
    
    var isAvialable: Bool = false
    
    private var isMobileAdsStartCalled = false
 
    let bannerView = GADBannerView(adSize: GADAdSizeBanner)
    
    func bannerViewController() -> UIViewController {
        let viewController = UIViewController()
        bannerView.adUnitID = Constants.admobMainBannerId
        bannerView.rootViewController = viewController
        viewController.view.addSubview(bannerView)
        return viewController
    }
    
    func startGoogleMobileAdsSDK() {
       guard !isMobileAdsStartCalled else { return }

       isMobileAdsStartCalled = true

       // Initialize the Google Mobile Ads SDK.
       GADMobileAds.sharedInstance().start()
#if DEBUG
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "346c2115db3d1e2bbca39e1fba12e3d9" ]
#endif
       // TODO: Request an ad.
       // GADInterstitialAd.load(...)
        
        isAvialable = true
        
    }
    
    func loadAds() {
        bannerView.load(GADRequest())
    }
    
}
