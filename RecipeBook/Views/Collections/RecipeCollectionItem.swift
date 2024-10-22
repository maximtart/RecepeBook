//
//  RecipeCollectionItem.swift
//  RecipeBook
//
//  Created by Maxim on 17.10.2024.
//

import SwiftUI

struct RecipeCollectionItem: View {
    @State var configuration: Configuration
    
    var body: some View {
        HStack {
            Image(systemName: "book")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .padding(8)
                .background(Color.orange)
                .cornerRadius(8)
                .padding(.leading, 8)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(configuration.cuisineType.displayValue)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(Color.black)
                    .minimumScaleFactor(0.5)
                
                Text("\(configuration.recipesCount) recipes count")
                    .font(.caption)
                    .foregroundStyle(Color.orange)
                    
            }
            
            Spacer()
        }
        .padding([.top, .bottom], 8)
        .background(Color.white)
        .contentShape(.rect)
        .cornerRadius(12)
        .shadow(
            color: .orange.opacity(0.05),
            radius: 8,
            x: 0,
            y: 8
        )
    }
}

extension RecipeCollectionItem {
    struct Configuration {
        let cuisineType: CuisineType
        let recipesCount: Int
    }
}

#Preview {
    RecipeCollectionItem(
        configuration: .init(
            cuisineType: .british,
            recipesCount: 12
        )
    )
}
