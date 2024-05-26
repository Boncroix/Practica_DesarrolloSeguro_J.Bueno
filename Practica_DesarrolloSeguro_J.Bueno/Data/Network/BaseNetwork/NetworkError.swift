//
//  NetworkError.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: - NetworkError
enum NetworkError: Error {
    case malformedURL
    case dataEncodingFailed
    case statusCodeError(Int)
    case noData
    case dataDecodingFailed
}

// Return String NetworkError
func errorMessage(for error: Error) -> String {
    guard let networkError = error as? NetworkError else {
        return NSLocalizedString("UNKNOWN ERROR", comment: "")
    }
    
    switch networkError {
    case .malformedURL:
        return NSLocalizedString("MALFORMED URL", comment: "")
    case .dataEncodingFailed:
        return NSLocalizedString("DATA ENCODING FAILED", comment: "")
    case .statusCodeError(let errorCode):
        return "\(NSLocalizedString("ERROR CODE", comment: ""))\(errorCode)"
    case .noData:
        return NSLocalizedString("NO DATA", comment: "")
    case .dataDecodingFailed:
        return NSLocalizedString("DATA DECODING FAILED", comment: "")
    }
}
