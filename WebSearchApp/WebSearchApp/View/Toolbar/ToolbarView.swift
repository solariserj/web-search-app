//
//  ToolbarView.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//

import SwiftUI

struct ToolbarView: View {
    
    @ObservedObject var viewModel: ToolbarViewModel
    
    @State var backAvialable = true
    
    var body: some View {
        HStack(spacing: 0) {
            searchButton
            
            if backAvialable {
                if viewModel.canAddToFavorite {
                    addFavoriteButton
                }
                
                backButton
            }
        }
        .onChange(of: viewModel.backIsAvialable) { value in
            backAvialable = value
        }
        .frame(height: 60)
    }
    
    var backButton: some View {
        Button(action: {
            viewModel.backTapped()
        }, label: {
            ZStack {
                Color.clear
                ZStack {
                    HStack {
                        Image("back_small1")
                            .resizable()
                            .frame(width: 40, height: 30)
                            
                        Text("Back")
                            .foregroundStyle(Color.black)
                    }
                    .padding(.vertical, 10)
//                    .padding(.horizontal, 30)
                }
                .frame(width: 150)
                .background(Capsule().stroke(.black, lineWidth: 3))
                .shadow(radius: 3, y: 2)
            }
        })
    }
    
    var addFavoriteButton: some View {
        Button(action: {
            viewModel.favoriteTapped()
        }, label: {
//            ZStack {
//                Color.white
                ZStack {
                    HStack {
                        Image("add_small")
                            .resizable()
                            .frame(width: 30, height: 30)
                            
//                        Text("Back")
//                            .foregroundStyle(Color.black)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                }
//                .frame(width: 150)
                .background(Capsule().stroke(.black, lineWidth: 3))
                .shadow(radius: 3, y: 2)
//            }
        })
    }
    
    var searchButton: some View {
        Button(action: {
            viewModel.searchTapped()
        }, label: {
            ZStack {
                Color.clear
                ZStack {
                HStack {
                    Image("search_small1")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Search")
                        .foregroundStyle(Color.black)
                }
                .padding(.vertical, 10)
//                .padding(.horizontal, 25)
            }
                .frame(width: 150)
                .background(Capsule().stroke(.black, lineWidth: 3))
                .shadow(radius: 3, y: 2)
            }
        })
    }
}

#Preview {
    ToolbarView(viewModel: .init(container: .default))
}
