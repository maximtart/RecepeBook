//
//  ContentViewModel.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import Foundation
import SwiftUI

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var recipes: [RecipeCard.Configuration] = []
    @Published var collections: [RecipeCollectionItem.Configuration] = []
    
    @Published var error: AlertErrorModel?
    
    private let recipesRepository: RecipesRepository
    
    init(
        recipes: [RecipeCard.Configuration] = [],
        collections: [RecipeCollectionItem.Configuration] = [],
        recipesRepository: RecipesRepository
    ) {
        self.recipes = recipes
        self.collections = collections
        self.recipesRepository = recipesRepository
    }
}

extension ContentViewModel {
    
    func fetchRecipesList() async {
        do {
            let list = try await recipesRepository.get()
            self.recipes = list.map {
                .init(
                    id: $0.id,
                    cuisineType: $0.cuisine,
                    name: $0.name,
                    image: $0.photoUrlLarge,
                    isMarkedAsFavorite: false,
                    youtubeLink: $0.youtubeUrl
                )
            }
        } catch {
            Task { @MainActor in
                try await Task.sleep(for: .milliseconds(200))
                self.error = .init(error: error)
            }
        }
    }
}
