//
//  RepositoryPokemon.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 18/5/24.
//

import Foundation

// MARK: - RepositoryPokemon
final class RepositoryPokemon: RepositoryNetworkPokemonProtocol {
    
    // MARK: Properties
    var networkPokemon: NetworkPokemonProtocol
    
    // MARK: Init
    init(networkPokemon: NetworkPokemonProtocol = NetworkPokemon()) {
        self.networkPokemon = networkPokemon
    }
    
    // MARK: Functions
    func getPokemon(offset: Int = 0, limit: Int = 20) async throws -> (Int, [Pokemon]) {
        return try await networkPokemon.getPokemon(offset: offset, limit: limit)
    }
}
