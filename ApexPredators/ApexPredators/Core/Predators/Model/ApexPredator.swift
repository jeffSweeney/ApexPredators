//
//  ApexPredator.swift
//  ApexPredators
//
//  Created by Jeffrey Sweeney on 3/23/24.
//

import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Decimal
    let longitude: Decimal
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
}

enum PredatorType: Decodable {
    case air
    case land
    case sea
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeString = try container.decode(String.self)
        
        switch typeString.lowercased() {
        case "air":
            self = .air
        case "land":
            self = .land
        case "sea":
            self = .sea
        default:
            self = .unknown
        }
    }
    
    var label: (name: String, color: Color) {
        switch self {
        case .air: ("Air", .teal)
        case .land: ("Land", .brown)
        case .sea: ("Sea", .blue)
        case .unknown: ("Unknown", .gray)
        }
    }
}

struct MovieScene: Decodable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}

