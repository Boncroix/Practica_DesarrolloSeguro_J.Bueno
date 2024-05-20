//
//  NetworkRequest.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: - NetworkRequest
struct NetworkRequest: NetworkRequestProtocol {
    
    // MARK: RequestForLIstPokemon
    func requestForListPokemon(offset: Int, limit: Int) async throws -> URLRequest {
        let endPoint = HTTPEndPoints.listPokemon(offset: offset, limit: limit)
        let endPointString = endPoint.endPointString
        
        guard let url = URL(string: "\(ConstApp.CONST_API_URL)\(endPointString)") else {
            throw NetworkError.malformedURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        request.setValue(HTTPMethods.content, forHTTPHeaderField: HTTPHeader.contentType)
        
        return request
    }
    
    // MARK: RequestForPokemon
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
