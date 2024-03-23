//
//  ApexPredator.swift
//  ApexPredators
//
//  Created by Jeffrey Sweeney on 3/23/24.
//

import Foundation

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Decimal
    let longitude: Decimal
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case latitude
        case longitude
        case movies
        case movieScenes = "movie_scenes"
        case link
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
}

struct MovieScene: Decodable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case movie
        case sceneDescription = "scene_description"
    }
}

