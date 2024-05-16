//
//  URLResponse+Extension.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 16/5/24.
//

import Foundation

extension URLResponse {
    func getStatusCode() -> Int {
        if let httpResponse = self as? HTTPURLResponse{
            return httpResponse.statusCode
        } else {
            return 0
        }
    }
}
