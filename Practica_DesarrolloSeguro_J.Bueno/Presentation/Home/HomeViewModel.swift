//
//  HomeViewModel.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 18/5/24.
//

import Foundation
import Combine
import LocalAuthentication


// MARK: - HomeViewModel
final class HomeViewModel: ObservableObject {
    
    // MARK: Properties
    let authentication: Authentication
    private let repository: RepositoryNetworkPokemonProtocol
    @Published var pokemonsEntry: PokemonEntry = PokemonEntry(count: 1, next: "", previous: "", results: [])
    @Published var pokemons: [Pokemon] = []
    @Published var status = Status.none
    
    // MARK: Init
    init(repository: RepositoryNetworkPokemonProtocol = RepositoryPokemon(), authentication: Authentication = Authentication.shared) {
        self.repository = repository
        self.authentication = authentication
    }
    
    // MARK: Functions
    func getPokemons(url: String? = nil) {
        self.status = .loading
        
        DispatchQueue.main.async {
            Task {
                do {
                    let (pokemonsEntry, pokemonsData) = try await self.repository.getPokemon(url: url)
                    self.pokemonsEntry = pokemonsEntry
                    self.pokemons = pokemonsData
                    self.status = .loaded
                } catch {
                    let errorMessage = errorMessage(for: error)
                    self.status = .error(error: errorMessage)
                    NSLog(errorMessage)
                }
            }
        }
    }
}
