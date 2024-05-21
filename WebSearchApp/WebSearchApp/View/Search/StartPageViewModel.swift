//
//  SearchViewModel.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//

import Foundation
import SwiftUI

class StartPageViewModel: ObservableObject {
    var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }

    func startSearch(_ text: String) {
        container.searchText = text
    }
    
}
