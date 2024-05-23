//
//  HomeView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 18/5/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK:  Properties
    @ObservedObject var homeViewModel: HomeViewModel
    private var nextPage: String? { homeViewModel.pokemonsEntry.next
    }
    private var prevPage: String? { homeViewModel.pokemonsEntry.previous
    }
    
    // MARK:  Init
    init(homeViewModel: HomeViewModel = HomeViewModel()) {
        self.homeViewModel = homeViewModel
    }

    
    // MARK: - View
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                List(homeViewModel.pokemons) { pokemon in
                    PokemonCellView(pokemon: pokemon)
                        .listRowBackground(Color.clear)
                }
                .navigationTitle("Pokemons")
                .navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationButton(title: "Prev", url: prevPage) { url in
                            homeViewModel.status = .nextPrev(url: url)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationButton(title: "Next", url: nextPage) { url in
                            homeViewModel.status = .nextPrev(url: url)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Subviews
struct BackgroundView: View {
    var body: some View {
        ZStack {
            Image("fondo1")
                .resizable()
                .ignoresSafeArea()
            
            Color.whiteBlack.opacity(0.9)
                .ignoresSafeArea()
        }
    }
}

struct NavigationButton: View {
    let title: String
    let url: String?
    let action: (String) -> Void
    
    var body: some View {
        if let url = url {
            Button(action: {
                action(url)
            }) {
                Text(title)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
