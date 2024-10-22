//
//  RecipeCard.swift
//  RecipeBook
//
//  Created by Maxim on 17.10.2024.
//

import SwiftUI
import Kingfisher

struct RecipeCard: View {
    @State private var configuration: Configuration
    
    @Environment(\.recipeListSize) var recipeListSize
    
    init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    var body: some View {
        KFImage(configuration.image)
            .placeholder {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                width: recipeListSize.width,
                height: recipeListSize.height
            )
            .clipped()
            .cornerRadius(16)
            .overlay(alignment: .bottomLeading) {
                RecipeCardNameOverlay(
                    name: configuration.name,
                    cuisineType: configuration.cuisineType.displayValue
                )
                .padding(.bottom, 16)
                .padding(.leading, 8)
            }
            .overlay {
                Image(systemName: "play.fill")
                    .foregroundColor(.orange)
                    .font(.system(size: 24))
                    .padding(8)
                    .background(Color.white)
                    .clipShape(.circle)
            }
    }
}

extension RecipeCard {
    struct Configuration: Identifiable {
        let id: UUID
        let cuisineType: CuisineType
        let name: String
        let image: URL?
        let isMarkedAsFavorite: Bool
        let youtubeLink: URL?
    }
}

#Preview {
    RecipeCard(
        configuration: .init(
            id: UUID(uuidString: "55dcfb29-fe1b-4c28-8d0b-361497ae27f7")!,
            cuisineType: .british,
            name: "Treacle Tart",
            image: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg"),
            isMarkedAsFavorite: false,
            youtubeLink: .init(string: "https://www.youtube.com/watch?v=fFLn1h80AGQ")
        )
    )
}
