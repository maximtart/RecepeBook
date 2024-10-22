//
//  RecipesRepository.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import SwiftUI

struct RecipesRepository {
    var get: @Sendable () async throws -> [RecipeModel]
}
