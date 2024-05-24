//
//  SSLPinningSecureURLSession.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 23/5/24.
//

import Foundation

// MARK: - SSLPinningSecureURLSession
class SSLPinningSecureURLSession {
    
    let session: URLSession
    
    init() {
        self.session = URLSession(configuration: .ephemeral, 
                                  delegate: SSLPinningDelegate(),
                                  delegateQueue: nil)
    }
    
}

// MARK: - Extension URLSession
extension URLSession {
    static var shared: URLSession {
        SSLPinningSecureURLSession().session
    }
}
