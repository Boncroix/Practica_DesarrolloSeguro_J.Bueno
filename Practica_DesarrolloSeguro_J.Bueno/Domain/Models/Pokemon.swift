//
//  Pokemon.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: Model Pokemon
struct Pokemon: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: PokemonSprites
}


struct PokemonSprites: Codable {
    let front_defaults: String
}
