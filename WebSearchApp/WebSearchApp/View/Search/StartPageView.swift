//
//  SearchView.swift
//  WebSearchApp
//
//  Created by Serjant Alexandru on 24.04.2024.
//

import SwiftUI

struct StartPageView: View {

    @ObservedObject var viewModel: StartPageViewModel

    @State var searchText: String = ""
    @FocusState private var isFocused: Bool
 
    var body: some View {
        VStack(spacing: 20) {
            Image("icon4")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(30)
                
            Text("Start to search")
                .font(.title)
            
            TextField("Your request", text: $searchText)
                .multilineTextAlignment(.center)
                .focused($isFocused)
                .keyboardType(.webSearch)
                .onSubmit {
                    viewModel.startSearch(searchText)
                    print("Search \(searchText)")
                    viewModel.container.type = .search
                }
            
        }
        .frame(width: 300)
        .padding()
        .onAppear {
            isFocused = true
        }
    }
}

#Preview {
    StartPageView(viewModel: .init(container: .default))
}
