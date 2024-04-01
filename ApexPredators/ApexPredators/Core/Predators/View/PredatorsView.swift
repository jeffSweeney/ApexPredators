//
//  PredatorsView.swift
//  ApexPredators
//
//  Created by Jeffrey Sweeney on 3/23/24.
//

import SwiftUI

struct PredatorsView: View {
    private let viewModel = PredatorsViewModel()
    
    var body: some View {
        List(viewModel.apexPredators) { predator in
            HStack {
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .shadow(color: .white, radius: 1)
                
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .bold()
                    
                    Text(predator.type.label.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 50)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(predator.type.label.color)
                        .clipShape(.capsule)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    PredatorsView()
}
