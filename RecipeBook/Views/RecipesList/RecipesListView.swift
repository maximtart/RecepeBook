//
//  RecipesListView.swift
//  RecipeBook
//
//  Created by Maxim on 17.10.2024.
//

import SwiftUI

struct RecipesListView: View {
    var recipes: [RecipeCard.Configuration]
    
    @Environment(\.recipeListSize) var recipeListSize
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(recipes, id: \.id) { item in
                    RecipeCard(configuration: item)
                    .onTapGesture {
                        if let url = item.youtubeLink {
                            UIApplication.shared.open(url)
                        }
                    }
                }
            }
            .frame(height: recipeListSize.height)
        }
        .padding()
    }
}

#Preview {
    RecipesListView(
        recipes: [
            .init(
                id: .init(uuidString: "55dcfb29-fe1b-4c28-8d0b-361497ae27f7")!,
                cuisineType: .british,
                name: "Treacle Tart",
                image: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg"),
                isMarkedAsFavorite: false,
                youtubeLink: .init(string: "https://www.youtube.com/watch?v=fFLn1h80AGQ")
            ),
            .init(
                id: .init(uuidString: "a1bedde3-2bc6-46f9-ab3c-0d98a2b11b64")!,
                cuisineType: .tunisian,
                name: "Tunisian Orange Cake",
                image: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/903015fb-7bc2-426b-aa1b-724d0007ce30/large.jpg"),
                isMarkedAsFavorite: false,
                youtubeLink: .init(string: "https://www.youtube.com/watch?v=fFLn1h80AGQ")
            )
        ]
    )
}
