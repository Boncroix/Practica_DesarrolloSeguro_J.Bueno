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
        
        ZStack {
            Image("fondo1")
                .resizable()
                .ignoresSafeArea()
            
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            
            NavigationView {
                List(homeViewModel.pokemons) { pokemon in
                    PokemonCellView(pokemon: pokemon)
                        .listRowBackground(Color.clear)
                }
                .navigationTitle("Pokemons")
                .navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
            }
            .background(.clear)
        }
        ignoresSafeArea()
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
