//
//  EnvironmentVariables.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import SwiftUI

private struct RecipeListSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .init(width: 200, height: 300)
}

extension EnvironmentValues {
    var recipeListSize: CGSize {
        get { self[RecipeListSizeKey.self] }
        set { self[RecipeListSizeKey.self] = newValue }
    }
}
