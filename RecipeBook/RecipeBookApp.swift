//
//  RecipeBookApp.swift
//  RecipeBook
//
//  Created by Maxim on 17.10.2024.
//

import SwiftUI

@main
struct RecipeBookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: .init(
                    recipesRepository: .init(
                        get: {
                            let response: GetRecipeResponse = try await APIRequestDispatcher
                                .request(apiRouter: .getRecipe)
                            
                            return response.recipes
                        }
                    )
                )
            )
        }
    }
}
