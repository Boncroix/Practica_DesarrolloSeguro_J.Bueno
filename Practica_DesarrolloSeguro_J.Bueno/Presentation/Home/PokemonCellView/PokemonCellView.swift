//
//  PokemonCellView.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 19/5/24.
//

import SwiftUI


// MARK: - PokemonCellView
struct PokemonCellView: View {
    
    // MARK: Properties
    var pokemon: Pokemon

    // MARK: Init
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    // MARK: View
    var body: some View {
        HStack {
            if let urlString = pokemon.sprites?.other?.home.frontDefault, let url = URL(string: urlString) {
                AsyncImage(url: url,
                           content: { image in
                               image.resizable()
                                    .frame(width: 150, height: 100)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                           },
                           placeholder: {
                               ProgressView()
                           })
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 100)
                    .foregroundColor(.gray)
            }
            
            VStack (alignment: .leading, content: {
                Text(pokemon.name ?? "Unknown")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding()
            })
        }
    }
}

// MARK: - Preview
#Preview {
    PokemonCellView(
        pokemon: Pokemon(id: 25, name: "Pikachu", height: 4, weight: 60, sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png", other: nil)))
}
