//
//  FavoriteService.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 18.05.2024.
//

import Foundation

struct FavoriteModel: Identifiable {
    let id = UUID()
    var link: String
    var name: String?
}

class FavortiteService {

    var favorites: [FavoriteModel] = []
    
    func appendFavorite(link: String) {
        guard favorites.first(where: { $0.link == link }) != nil else { return }
        favorites.append(.init(link: link, name: "\(favorites.count+1)"))
    }
    
    func deleteFavorite(_ model: FavoriteModel) {
        if let index = favorites.firstIndex(where: { $0.id == model.id }) {
            favorites.remove(at: index)
        }
    }
    
    
}

