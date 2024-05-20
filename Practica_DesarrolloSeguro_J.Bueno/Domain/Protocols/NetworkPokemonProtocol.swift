//
//  NetworkPokemonProtocol.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 18/5/24.
//

import Foundation

// MARK: - NEtworkPokemonProtocol
protocol NetworkPokemonProtocol {
    
    // MARK: Functions
    func getPokemon(offset: Int, limit: Int) async throws -> (Int, [Pokemon])
}
