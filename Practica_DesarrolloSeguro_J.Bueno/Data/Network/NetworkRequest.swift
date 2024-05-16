//
//  NetworkRequest.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: - NetworkRequest
struct NetworkRequest {
    
    // MARK: Request for listPokemon
    func requestForListPokemon(offset: Int, limit: Int) async throws -> URLRequest {
        
        guard let url = URL(string: "\(ConstApp.CONST_API_URL)\(HTTPEndPoints.listPokemon(offset: offset, limit: limit))") else {
            throw NetworkError.malformedURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        request.setValue(HTTPMethods.content, forHTTPHeaderField: HTTPHeader.contentType)
        
        return request
    }
    
    func requestForPokemon(url: String) async throws -> URLRequest {
        
        guard let url = URL(string: url) else {
            throw NetworkError.malformedURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        request.setValue(HTTPMethods.content, forHTTPHeaderField: HTTPHeader.contentType)
        
        return request
    }
}
