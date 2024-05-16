//
//  PokemonList.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: Model Pokemon List
struct PokemonEntry: Codable {
    var count: Int
    var results: [PokemonList]
}

struct PokemonList: Codable {
    var name: String
    var url: String
}
