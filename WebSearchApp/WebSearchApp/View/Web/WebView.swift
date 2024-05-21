//
//  WebView.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 27.04.2024.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    
    let webView: WKWebView
    
    init() {
        self.webView = WKWebView()
        
//        self.webView.navigationDelegate = protocolClass
        
//        _ = webView.observe(\.backForwardList, options: .new) { (webView, change) in
//                     print("Web view URL changed to \(webView.backForwardList.currentItem?.url.absoluteString ?? "Empty")", webView.scrollView.contentSize.width, webView.scrollView.contentSize.height)
//               }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        print("updateUIView")
    }
    
    var backAvialable: Bool {
        webView.backForwardList.backItem?.url.absoluteString != "about:blank"
    }
    
    func goBack(){
        webView.goBack()
    }
    
    func goForward(){
        webView.goForward()
    }
    
    
    func loadURL(urlString: String) {
        webView.load(URLRequest(url: URL(string: urlString)!))
    }

    func loadURL(_ url: URL) {
        webView.load(URLRequest(url: url))
    }

    func reset() {
        webView.closeAllMediaPresentations {
            if let first = webView.backForwardList.backList.first {
                webView.go(to: first)
            }
            webView.load(URLRequest(url: URL(string:"about:blank")!))
        }
    }
}

