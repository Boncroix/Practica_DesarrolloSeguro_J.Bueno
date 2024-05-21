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
    @Published var pokemons: [Pokemon] = []
    @Published var status = Status.none
    
    // MARK: Init
    init(repository: RepositoryNetworkPokemonProtocol = RepositoryPokemon()) {
        self.repository = repository
    }
    
    // MARK: Functions
    func getPokemons() {
        self.status = .loading
        
        DispatchQueue.main.async {
            Task {
                do {
                    let pokemonsData = try await self.repository.getPokemon()
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
