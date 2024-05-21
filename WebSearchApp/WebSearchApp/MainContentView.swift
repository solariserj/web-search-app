//
//  ContentView.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 23.04.2024.
//

import SwiftUI

enum AppStateType {
    case home, search
}

struct MainContentView: View {
    
    @ObservedObject var viewModel: MainContentViewModel
    
    @State private var hasViewAppeared = false
    private let formViewControllerRepresentable = FormViewControllerRepresentable()
    
    var body: some View {
        ZStack {
            switch viewModel.type {
            case .home:
                StartPageView(viewModel: viewModel.searchViewModel)
            case .search:
                VStack(spacing: 0) {
                    WebPageView(viewModel: viewModel.webPageViewModel)
                    ToolbarView(viewModel: viewModel.toolbarViewModel)
                    if viewModel.showAds {
                        AdView(viewModel: viewModel.adViewModel)
                    }
                }
            }
        }
        .background {
              // Add the ViewControllerRepresentable to the background so it
              // doesn't influence the placement of other views in the view hierarchy.
              formViewControllerRepresentable
                .frame(width: .zero, height: .zero)

            }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            viewModel.container.trackingManager.requestAutoirisation {
//                viewModel.showAds = true
                
                guard !hasViewAppeared else { return }
                hasViewAppeared = true
                viewModel.container.trackingManager.showConsent(on: formViewControllerRepresentable.viewController)
            }
        }
        .onAppear {
            // Gather consent only the first time the view appears.
//            guard !hasViewAppeared else { return }
//            hasViewAppeared = true
//            viewModel.container.trackingManager.showConsent(on: formViewControllerRepresentable.viewController)
        }
    }
}

#Preview {
    MainContentView(viewModel: .init(.default))
}
