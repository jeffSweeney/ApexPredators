//
//  PredatorsViewModel.swift
//  ApexPredators
//
//  Created by Jeffrey Sweeney on 3/23/24.
//

import Foundation

class PredatorsViewModel: ObservableObject {
    @Published var apexPredators: [ApexPredator] = []
    
    init() {
        decodePredators()
    }
    
    private func decodePredators() {
        guard let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            self.apexPredators = try decoder.decode([ApexPredator].self, from: data)
        } catch {
            print("DEBUG: Error decoding - \(error.localizedDescription)")
        }
    }
}
