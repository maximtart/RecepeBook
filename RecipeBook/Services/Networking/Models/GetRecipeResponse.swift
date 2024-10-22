//
//  GetRecipeResponse.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import Foundation

struct GetRecipeResponse: Decodable {
    let recipes: [RecipeModel]
}
