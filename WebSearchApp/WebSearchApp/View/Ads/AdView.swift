//
//  AdView.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//

import GoogleMobileAds
import SwiftUI

struct AdView: View {
    
    @ObservedObject var viewModel: AdViewModel
    
    var body: some View {
        BannerView(container: viewModel.container)
                   .frame(width: GADAdSizeBanner.size.width,
                          height: GADAdSizeBanner.size.height)
//        ZStack {
//            Color.cyan
//            Text("Ad View")
//        }
//        .frame(height: 50)
    }
}

struct BannerView: UIViewControllerRepresentable {
    
    var container: DIContainer
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        container.adService.bannerViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        container.adService.loadAds()
    }
}


#Preview {
    AdView(viewModel: .init(container: .default))
}
