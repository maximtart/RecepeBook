//
//  APIRouter.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import Foundation

enum APIRouter {
    case getRecipe

    var host: String {
        switch self {
        case .getRecipe:
            return "d3jbb8n5wk0qxi.cloudfront.net"
        }
    }

    var path: String {
        switch self {
        case .getRecipe:
            return "/recipes.json"
        }
    }

    var method: String {
        switch self {
        case .getRecipe:
            return "GET"
        }
    }
}
