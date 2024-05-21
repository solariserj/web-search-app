//
//  MainContentViewModel.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//

import Foundation

class MainContentViewModel: ObservableObject {
    
    var container: DIContainer
    
    var searchViewModel: StartPageViewModel
    var toolbarViewModel: ToolbarViewModel
    var webPageViewModel: WebPageViewModel
    var adViewModel: AdViewModel
    
    @Published var type: AppStateType = .home
    
    var showAds: Bool {
        container.adService.isAvialable
    }
    
    init(_ container: DIContainer) {
        self.container = container

        searchViewModel = .init(container: container)
        toolbarViewModel = .init(container: container)
        webPageViewModel = .init(container: container)
        adViewModel = .init(container: container)
        
        self.setupBinding()
    }
    
    func setupBinding() {
        container.$type.assign(to: &$type)
    }
 
    
}
