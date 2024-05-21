//
//  NetworkPokemon.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: - NetworkPokemonList
final class NetworkPokemon: NetworkPokemonProtocol {

    // MARK: GetPokemon
    func getPokemon() async throws -> [Pokemon] {
        
        var pokemons: [Pokemon] = []
        
        let request = try await NetworkRequest().requestForListPokemon()
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        
        guard let modelResponse = try? JSONDecoder().decode(PokemonEntry.self, from: data) else {
            throw NetworkError.dataDecodingFailed
        }
        
        for pokemon in modelResponse.results {
            pokemons.append(try await getDetailPokemon(url: pokemon.url ?? ""))
        }
        
        return pokemons
    }

    // MARK: GetDetailPokemon
    private func getDetailPokemon(url: String) async throws -> Pokemon {
        
        let request = try await NetworkRequest().requestForPokemon(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        
        guard let modelResponse = try? JSONDecoder().decode(Pokemon.self, from: data) else {
            throw NetworkError.dataDecodingFailed
        }

        return modelResponse
    }
}
