//
//  WebViewModel.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//

import Foundation

import Combine
import SwiftUI

class WebPageViewModel: ObservableObject {
    var container: DIContainer
    @Published var requestText: String = ""
    @Published var requestURL: URL?
    @Published var presentBackAlert: Bool = false
    
    let webView = WebView()
    
    var webViewURLObserver: NSKeyValueObservation?          // Observer for URL
    var webViewTitleObserver: NSKeyValueObservation?
    
    private var cancelBag = CancelBag()

    init(container: DIContainer) {
        self.container = container

        setupBinding()
    }
    
    func setupBinding() {
        container.$searchText
            .sink { [weak self] value in
                guard let value else { return }
                self?.start(with: value)
        }
        .store(in: &cancelBag)
        
        container.$backTapped
            .dropFirst()
            .sink { [weak self] _ in
            self?.back()
        }
        .store(in: &cancelBag)
        
        container.$type
            .sink { [weak self] type in
            if case .home = type {
                self?.webView.reset()
            }
        }
        .store(in: &cancelBag)
        
        
        webViewURLObserver = webView.webView.observe(\.url, options: .new) { [weak self] webView, change in
           
            guard  let url =  change.newValue??.absoluteString,
                    url.hasPrefix(Constants.linkBase) || url.hasPrefix(Constants.emptyLink) else {
                self?.container.canUseFavorite = true
                return
            }
            self?.container.canUseFavorite = false
        }
        
//        webView.observe(\.url, changeHandler: { (webView, change) in
//             print("Web view URL changed to \(webView.backForwardList.currentItem?.url.absoluteString ?? "Empty")", webView.scrollView.contentSize.width, webView.scrollView.contentSize.height)
//       })
        
        container.$addFavoriteTapped
            .dropFirst()
            .sink { [weak self] _ in
                if let link = self?.webView.webView.url?.absoluteString {
                    print("add to favorite \(link)")
                    self?.container.favorite.appendFavorite(link: link)
                    
                }
        }
            .store(in: &cancelBag)
    }
    
    func start(with text: String) {
        requestText = text
        let urlString = Constants.linkBase + text
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed){
            requestURL = URL(string: encoded)
        } else {
            // Error url
        }
    }
    
    func back() {
        print(" Go Back ")
        if webView.backAvialable {
            webView.goBack()
        } else {
            presentBackAlert = true
        }
    }
}

