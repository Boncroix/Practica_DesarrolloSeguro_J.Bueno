//
//  Pokemon.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 15/5/24.
//

import Foundation

// MARK: - Model Pokemon
struct Pokemon: Codable, Identifiable {
    let id: Int?
    let name: String?
    let height: Int?
    let weight: Int?
    let sprites: Sprites?
}

// MARK: - Sprites
class Sprites: Codable {
    let frontDefault: String?
    let other: Other?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
    }

    init(frontDefault: String, other: Other?) {
        self.frontDefault = frontDefault
        self.other = other
    }
}

// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld
    let home: Home
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Home
struct Home: Codable {
    let frontDefault: String
    let frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
