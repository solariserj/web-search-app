//
//  WebSearchAppApp.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 23.04.2024.
//
import AdSupport
import AppTrackingTransparency
import SwiftUI
import FirebaseCore
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//      DispatchQueue.main.async {
//          ATTrackingManager.requestTrackingAuthorization { status in
//              if status == .authorized {
//                  let idfa = ASIdentifierManager.shared().advertisingIdentifier
//                  print("Пользователь разрешил доступ. IDFA: ", idfa)
//              }
              
              FirebaseApp.configure()
//          }
//      }
      return true
  }

}


@main
struct WebSearchAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainContentView(viewModel: .init(.default))
        }
    }
}
