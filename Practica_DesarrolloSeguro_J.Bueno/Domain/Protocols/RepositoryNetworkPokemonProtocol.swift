//
//  RepositoryNetworkPokemonProtocol.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 18/5/24.
//

import Foundation

// MARK: - RepositoryNetworkPokemonProtocol
protocol RepositoryNetworkPokemonProtocol {
    
    // MARK: Properties
    var networkPokemon: NetworkPokemonProtocol { get }
    
    // MARK: Functions
    func getPokemon(url: String?) async throws -> (PokemonEntry, [Pokemon])
}
