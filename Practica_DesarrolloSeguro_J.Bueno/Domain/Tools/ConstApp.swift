//
//  ConstApp.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: - ConstantApp
struct ConstApp {
    static let CONST_API_URL = "https://pokeapi.co/api/v2/"
    
    static let home = Home(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/25.png", frontShiny: "")
    static let other = Other(home: home)
    static let spriter = Sprites(frontDefault: "", other: other)
    static let POKEMON_TEST = Pokemon(id: 25, name: "Pikachu", height: 4, weight: 60, sprites: spriter)
    
}
