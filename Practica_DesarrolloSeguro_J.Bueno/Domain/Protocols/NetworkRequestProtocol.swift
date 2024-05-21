//
//  NetworkRequestProtocol.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 18/5/24.
//

import Foundation

// MARK: - NetworkRequesProtocol
protocol NetworkRequestProtocol {
    
    // MARK: Functions
    func requestForListPokemon() async throws -> URLRequest
    
    func requestForPokemon(url: String) async throws -> URLRequest
}
