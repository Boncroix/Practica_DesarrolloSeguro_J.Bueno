//
//  HomeView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 18/5/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @ObservedObject var homeViewModel: HomeViewModel
    
    
    // MARK: - Init
    init(homeViewModel: HomeViewModel = HomeViewModel()) {
        self.homeViewModel = homeViewModel
    }
    
    // MARK: - View
    var body: some View {
        
        let nextPage = homeViewModel.pokemonsEntry.next
        let prevPage = homeViewModel.pokemonsEntry.previous
        
        NavigationView {
            ZStack {
                Image("fondo1")
                    .resizable()
                    .ignoresSafeArea()
                
                Color.whiteBlack.opacity(0.9)
                    .ignoresSafeArea()
                
                List(homeViewModel.pokemons) { pokemon in
                    PokemonCellView(pokemon: pokemon)
                        .listRowBackground(Color.clear)
                }
                .navigationTitle("Pokemons")
                .navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if let previousURL = homeViewModel.pokemonsEntry.previous {
                            Button(action: {
                                homeViewModel.status = .nextPrev(url: previousURL)
                            }) {
                                Text("Prev")
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if let nextURL = homeViewModel.pokemonsEntry.next {
                            Button(action: {
                                homeViewModel.status = .nextPrev(url: nextURL)
                            }) {
                                Text("Next")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
