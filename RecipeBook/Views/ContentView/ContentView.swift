//
//  ContentView.swift
//  RecipeBook
//
//  Created by Maxim on 17.10.2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject private var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            RecipesListView(
                recipes: viewModel.recipes
            )
            RecipeCollections(
                list: viewModel.collections
            )
            .padding([.leading, .trailing], 8)
        }
        .background(Color.screenBackground)
        .refreshable {
            await viewModel.fetchRecipesList()
        }
        .onAppear {
            Task { await viewModel.fetchRecipesList() }
        }
        .alert(item: $viewModel.error) { error in
            Alert(
                title: Text("Ooops!"),
                message: Text(error.description),
                dismissButton: .default(Text("OK"))
            )
            
        }
    }
}

#Preview {
    ContentView(
        viewModel: .init(
            recipes: [
                RecipeCard.Configuration(
                    id: UUID(uuidString: "55dcfb29-fe1b-4c28-8d0b-361497ae27f7")!,
                    cuisineType: .british,
                    name: "Treacle Tart",
                    image: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg"),
                    isMarkedAsFavorite: false,
                    youtubeLink: .init(string: "https://www.youtube.com/watch?v=fFLn1h80AGQ")
                ),
                RecipeCard.Configuration(
                    id: UUID(uuidString: "a1bedde3-2bc6-46f9-ab3c-0d98a2b11b64")!,
                    cuisineType: .tunisian,
                    name: "Tunisian Orange Cake",
                    image: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/903015fb-7bc2-426b-aa1b-724d0007ce30/large.jpg"),
                    isMarkedAsFavorite: false,
                    youtubeLink: .init(string: "https://www.youtube.com/watch?v=fFLn1h80AGQ")
                ),
                RecipeCard.Configuration(
                    id: UUID(uuidString: "2b9003b5-000d-445a-8b19-bbaed1b9f851")!,
                    cuisineType: .british,
                    name: "Spotted Dick",
                    image: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/1990117c-dcb1-41aa-bdaf-562b23bdf3d0/large.jpg"),
                    isMarkedAsFavorite: false,
                    youtubeLink: .init(string: "https://www.youtube.com/watch?v=fFLn1h80AGQ")
                )
            ],
            collections: [
                RecipeCollectionItem.Configuration(
                    cuisineType: .american,
                    recipesCount: 10
                ),
                RecipeCollectionItem.Configuration(
                    cuisineType: .canadian,
                    recipesCount: 20
                )
            ],
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
