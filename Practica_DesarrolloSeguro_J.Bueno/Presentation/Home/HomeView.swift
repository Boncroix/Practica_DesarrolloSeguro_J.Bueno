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
        NavigationView {
            List(homeViewModel.pokemons) { pokemon in
                PokemonCellView(pokemon: pokemon)
            }
            .navigationTitle("Pokemons")
            .scrollContentBackground(.hidden)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
