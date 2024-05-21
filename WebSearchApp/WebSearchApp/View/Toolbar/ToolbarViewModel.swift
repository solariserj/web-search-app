//
//  ToolbarViewModel.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//
import Combine
import Foundation

typealias EmptyComplition = (()->Void)

class ToolbarViewModel: ObservableObject {
    
    var container: DIContainer
//    var searchTapped: EmptyComplition?
//    var backTapped: EmptyComplition?
    
    @Published var backIsAvialable = true
    @Published var canAddToFavorite = true
    
    init(container: DIContainer) {
        self.container = container
        
        setupBinding()
    }
    
    func setupBinding() {
        container.$backIsAvialable.assign(to: &$backIsAvialable)
        container.$canUseFavorite.assign(to: &$canAddToFavorite)
    }
    
    func searchTapped() {
        print("Search tapped")

        container.type = .home
   }

    func backTapped() {
        print("Back tapped")
        container.backTapped.toggle()
    }
    
    func favoriteTapped() {
        print("Favorite tapped")
        container.addFavoriteTapped.toggle()
    }
}
