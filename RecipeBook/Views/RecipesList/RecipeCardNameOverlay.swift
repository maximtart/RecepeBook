//
//  RecipeCardNameOverlay.swift
//  RecipeBook
//
//  Created by Maxim on 17.10.2024.
//


import SwiftUI

struct RecipeCardNameOverlay: View {
    let name: String
    let cuisineType: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(.subheadline)
                .foregroundStyle(Color.white)
                .minimumScaleFactor(0.5)
            
            Text(cuisineType)
                .font(.caption)
                .foregroundStyle(Color.white)
                
        }
        .padding([.leading, .trailing], 8)
        .padding([.top, .bottom], 4)
        .background(
            Color.black.opacity(0.25)
        )
        .cornerRadius(8)
    }
}

#Preview {
    RecipeCardNameOverlay(
        name: "Treacle Tart",
        cuisineType: "British"
    )
}
