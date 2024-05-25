//
//  Crypto.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 25/5/24.
//

import Foundation
import CryptoKit

// MARK: - Crypto
class Crypto {
    // MARK: Properties
    private var key: String = ""
    private var selaledDataBox: String = ""
    
    // MARK: Init
    init(selaledDataBox: [UInt8]) {
        guard let unwrappedSelaledDataBox = String(data: Data(selaledDataBox), encoding: .utf8) else {
            print("SSLPinning error: unable to obtain selaledDataBox")
            return
        }
        let keyData: [UInt8] = [0x12+0x5E,0x32+0x2F,0x6A+0x09,0x49+0x2A,0xE1-0x6A,0x6A+0x05,0x56+0x1C,0xA1-0x3D]
        guard let unwrappedKey = String(data: Data(keyData), encoding: .utf8) else {
            print("SSLPinning error: unable to obtain local public key")
            return
        }
        self.key = unwrappedKey
        self.selaledDataBox = unwrappedSelaledDataBox
    }
    
    //: ## Enum to define the size of the key to be used in AES encryption.
    enum AESKeySize: Int {
        case bits128 = 16
        case bits192 = 24
        case bits256 = 32
    }
    
    // MARK: Private Functions
    //: ## Función de padding para clave encriptación AES
    private func paddedKey_PKCS7(from key: String, withSize size: AESKeySize = .bits256) -> Data {
        // Get the data from the key in Bytes
        guard let keyData = key.data(using: .utf8) else { return Data() }
        // If the key is already the right size, return it
        if(keyData.count == size.rawValue) {return keyData}
        // If the key is bigger, truncate it and return it
        if(keyData.count > size.rawValue) {return keyData.prefix(size.rawValue)}
        // If the key is smaller, pad it
        let paddingSize = size.rawValue - keyData.count % size.rawValue
        let paddingByte: UInt8 = UInt8(paddingSize)
        let padding = Data(repeating: paddingByte, count: paddingSize)
        return keyData + padding
    }
    //: ## Función de encriptación AES-GCM
    private func encrypt(input: Data, key: String) -> Data {
        do {
            // Get the correct length key
            let keyData = paddedKey_PKCS7(from: key, withSize: .bits128) // 16, 24 OR 32 bytes long
            // Get the symmetric key from the key as a string
            let key = SymmetricKey(data: keyData)
            // Create the box containing the data with the key
            let sealed = try AES.GCM.seal(input, using: key)
            // Return the combination of the nonce, cypher text and tag
            return sealed.combined!
        } catch _ {
            return "Error while encryption".data(using: .utf8)!
        }
    }
    //: ## Función de desencriptación AES-GCM
    private func decrypt(input: Data, key: String) -> Data {
        do {
            // Get the correct length key
            let keyData = paddedKey_PKCS7(from: key, withSize: .bits128)
            // Get the symmetric key from the key as a string
            let key = SymmetricKey(data: keyData)
            // Get box from the input, if the data is not a box then throw an error
            let box = try AES.GCM.SealedBox(combined: input)
            // Get the plaintext. If any error occurs during the opening process then throw exception
            let opened = try AES.GCM.open(box, using: key)
            // Return the cipher text
            return opened
        } catch {
            return "Error while decryption".data(using: .utf8)!
        }
    }
    
    // MARK: Public Functions
    public func getDecrypted() -> String? {
        guard let sealedDataBoxData = Data(base64Encoded: self.selaledDataBox) else {
            print("Error while decrypting public key: sealed data box is not valid")
            return nil
        }
        
        let data = decrypt(input: sealedDataBoxData, key: self.key)
        return String(data: data, encoding: .utf8)
    }
}
