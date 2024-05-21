//
//  WebView.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//

import Foundation
import SwiftUI

struct WebPageView: View {
    
    @ObservedObject var viewModel: WebPageViewModel
    
    var body: some View {
        ZStack {
            viewModel.webView
        }
        .onReceive(viewModel.$requestURL) { value in
            guard let value else { return }
            DispatchQueue.main.async {
                viewModel.webView.loadURL(value)
            }
        }
        .alert("You on top of search, you can start another search", isPresented: $viewModel.presentBackAlert) {
            Button("OK") {
                viewModel.presentBackAlert = false
            }
        }
    }
}

#Preview {
    WebPageView(viewModel: .init(container: .default))
}
