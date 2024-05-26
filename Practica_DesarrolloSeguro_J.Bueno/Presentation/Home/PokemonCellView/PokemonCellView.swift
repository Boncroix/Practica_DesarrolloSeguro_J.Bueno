//
//  PokemonCellView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 19/5/24.
//

import SwiftUI


import SwiftUI

// MARK: - PokemonCellView
struct PokemonCellView: View {
    
    // MARK: Properties
    var pokemon: Pokemon
    
    // MARK: View
    var body: some View {
        HStack {
            pokemonImage
            pokemonInfo
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.gray.opacity(0.4))
        )
    }
    
    // MARK: SubViews
    private var pokemonImage: some View {
        Group {
            if let urlString = pokemon.sprites?.other?.home.frontDefault, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .frame(width: 150, height: 150)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                } placeholder: {
                    placeholderImage
                }
            } else {
                placeholderImage
            }
        }
    }
    
    private var placeholderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .foregroundColor(.gray)
    }
    
    private var pokemonInfo: some View {
        VStack(alignment: .leading) {
            Text(pokemon.name ?? "Unknown")
                .textCase(.uppercase)
                .bold()
                .font(.system(size: 16))
                .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    PokemonCellView(
        pokemon: ConstApp.POKEMON_TEST
    )
}
