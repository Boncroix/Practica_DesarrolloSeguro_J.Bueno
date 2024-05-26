//
//  Authentication.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 26/5/24.
//

import Foundation
import LocalAuthentication

// MARK: - Authentication
class Authentication {
    
    // MARK: Singleton
    static let shared = Authentication()
    
    // MARK: Properties
    private let context = LAContext()
    private var error: NSError?
    
    
    // MARK: Methods
    func authenticateUser(completion: @escaping (Bool) -> Void) {
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Sign in to access the application"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { succes, error in
                DispatchQueue.main.async {
                    completion(succes)
                }
            }
        }
    }
}
