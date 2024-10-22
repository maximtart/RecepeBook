//
//  RecipeCollections.swift
//  RecipeBook
//
//  Created by Maxim on 17.10.2024.
//

import SwiftUI

struct RecipeCollections: View {
    let list: [RecipeCollectionItem.Configuration]
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Recipe Collections")
                    .font(.title2.weight(.medium))
                    .foregroundStyle(Color.black)
                    .padding(.leading, 8)
                
                Spacer()
            }
            
            VStack {
                ForEach(list, id: \.cuisineType) {
                    RecipeCollectionItem(configuration: $0)
                }
            }
        }
    }
}

#Preview {
    RecipeCollections(
        list: [
            .init(cuisineType: .american, recipesCount: 11),
            .init(cuisineType: .croatian, recipesCount: 3),
        ]
    )
}

