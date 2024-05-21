//
//  TrackingManager.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 13.05.2024.
//

import Foundation
import AppTrackingTransparency
import UserMessagingPlatform
import UserMessagingPlatformTarget

class TrackingManager {
    
    var adService: AdsService
    
    init(_ adService: AdsService) {
        self.adService = adService
    }
    
    func requestAutoirisation(_ completion: (()->Void)?) {
        guard ATTrackingManager.trackingAuthorizationStatus == .notDetermined else {
            completion?()
            return
        }
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
            completion?()
        })
    }
    
    
    func showConsent(on viewController: UIViewController) {
        
        var debugSettings = UMPDebugSettings()
        #if DEBUG
            debugSettings.testDeviceIdentifiers = [ "274897F3-E285-49B0-B5D3-513F404DE684" ]
            debugSettings.geography = .EEA
        #endif
        // Create a UMPRequestParameters object.
        let parameters = UMPRequestParameters()
          parameters.debugSettings = debugSettings
        // Set tag for under age of consent. false means users are not under age
        // of consent.
        parameters.tagForUnderAgeOfConsent = false

        if UMPConsentInformation.sharedInstance.consentStatus == .obtained {
            if UMPConsentInformation.sharedInstance.canRequestAds {
                adService.startGoogleMobileAdsSDK()
            }
            return
        }
        // Request an update for the consent information.
        UMPConsentInformation.sharedInstance.requestConsentInfoUpdate(with: parameters) {
           requestConsentError in

          if let consentError = requestConsentError {
            // Consent gathering failed.
            return print("Error: ***\(consentError.localizedDescription)")
          }
           

          UMPConsentForm.loadAndPresentIfRequired(from: viewController) { [weak self] (loadAndPresentError) in

            if let consentError = loadAndPresentError {
              // Consent gathering failed.
              return print("Error: \(consentError.localizedDescription)")
            }

            // Consent gathering completed.
            if UMPConsentInformation.sharedInstance.canRequestAds {
                self?.adService.startGoogleMobileAdsSDK()
            }
          }
        }

        // Check if you can initialize the Google Mobile Ads SDK in parallel
        // while checking for new consent information. Consent obtained in
        // the previous session can be used to request ads.
//        if UMPConsentInformation.sharedInstance.canRequestAds {
//            adService.startGoogleMobileAdsSDK()
//        }
        
    }
    
}
