//
//  SSLPinningDelegate.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 23/5/24.
//

import Foundation
import CommonCrypto
import CryptoKit

// MARK: - SSLPinningDelegate
class SSLPinningDelegate: NSObject {
    private var localPublicKeyHashBase64 = "XM/zPZlyGRsb47ZGBJvaZGYVjQvjOrF6u5A5sxyDakk="
}

// MARK: - Extension URLSessionDelegate functions
extension SSLPinningDelegate: URLSessionDelegate {
    
    // MARK: Functions
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        // Get server trust
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            print("SSLPinning error: server didn't present trust")
            return
        }
        
        // Get Certificates
        let serverCertificates: [SecCertificate]?
        serverCertificates = SecTrustCopyCertificateChain(serverTrust) as? [SecCertificate]
        guard let serverCertificate = serverCertificates?.first else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            print("SSLPinning error: server certificate is nil")
            return
        }
        
        // Get Public Key
        guard let serverPublicKey = SecCertificateCopyKey(serverCertificate) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            print("SSLPinning error: server public key is nil")
            return
        }
        
        // Transform Public Key
        guard let serverPublicKeyRep = SecKeyCopyExternalRepresentation(serverPublicKey, nil) else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            print("SSLPinning error: unable to convert server public key to data")
            return
        }
        
        // Tansform Data
        let serverPublicKeyData = serverPublicKeyRep as Data
        let serverHashBase64 = sha256CryptoKit(data: serverPublicKeyData)
        
        // Check that the local public key is the same as that of the server
        if serverHashBase64 == self.localPublicKeyHashBase64 {
            // Server Validated
            completionHandler(.useCredential, URLCredential(trust: serverTrust))
            print("SSLPinning filter passed")
        } else {
            // Server public key doesnt match
            completionHandler(.cancelAuthenticationChallenge, nil)
            print("SSLPinning error: server public key doesn't match")
        }
    }

    func sha256CryptoKit(data: Data) -> String {
        let hash = SHA256.hash(data: data)
        return Data(hash).base64EncodedString()
    }
}
