//
//  DIContainer.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//
import Combine
import Foundation

class DIContainer {
    
    @Published var type: AppStateType = .home
    @Published var searchText: String?
    @Published var backTapped = false
    @Published var addFavoriteTapped = false
    @Published var canUseFavorite = false
    @Published var backIsAvialable = false
    
    static let `default` = DIContainer()
    
    var adService: AdsService
    var trackingManager: TrackingManager
    var favorite: FavortiteService
    
    init() {
        self.adService = AdsService()
        self.trackingManager = TrackingManager(self.adService)
        self.favorite = FavortiteService()
    }
}
