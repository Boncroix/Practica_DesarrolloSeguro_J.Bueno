//
//  HTTPSEndpoints.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: - HTTPEndPointsApp
enum HTTPEndPoints {
    case listPokemon(offset: Int, limit: Int)
    
    var endPointString: String {
        switch self {
        case .listPokemon(let offset, let limit):
            return "pokemon?offset=\(offset)&limit=\(limit)"
        }
    }
}
