//
//  RecipeModel.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import Foundation

struct RecipeModel: Identifiable {
    let id: UUID
    let cuisine: CuisineType
    let name: String
    let photoUrlLarge: URL?
    let photoUrlSmall: URL?
    let sourceUrl: URL?
    let youtubeUrl: URL?
}

extension RecipeModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine, name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
}

