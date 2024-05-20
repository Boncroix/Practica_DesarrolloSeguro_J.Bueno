//
//  HomeViewModel.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 18/5/24.
//

import Foundation
import Combine

// MARK: - HomeViewModel
final class HomeViewModel: ObservableObject {
    
    // MARK: Properties
    let repository: RepositoryNetworkPokemonProtocol
    @Published var numberOfPokemons: Int = 0
    @Published var pokemons: [Pokemon] = []
    
    // MARK: Init
    init(repository: RepositoryNetworkPokemonProtocol = RepositoryPokemon()) {
        self.repository = repository
        getPokemons()
    }
    
    // MARK: Functions
    func getPokemons() {
        DispatchQueue.main.async {
            Task {
                do {
                    let (numberOfPokemons, pokemonsData) = try await self.repository.getPokemon(offset: 0, limit: 20)
                    self.numberOfPokemons = numberOfPokemons
                    self.pokemons = pokemonsData
                } catch {
                    let errorMessage = errorMessage(for: error)
                    NSLog(errorMessage)
                }
            }
        }
    }
}
