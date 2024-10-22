//
//  CuisineType.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import Foundation

enum CuisineType: Hashable {
    case french, canadian, british
    case tunisian, croatian, portuguese
    case russian, malaysian, polish
    case american, greek, italian
    case custom(String)
    
    var displayValue: String {
        switch self {
        case let .custom(value):
            return value.capitalized
        default:
            return "\(self)".capitalized
        }
    }
}

extension CuisineType: Decodable {
    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let status = try container.decode(String.self)
        switch status.lowercased() {
        case "french": self = .french
        case "canadian": self = .canadian
        case "british": self = .british
        case "tunisian": self = .tunisian
        case "croatian": self = .croatian
        case "portuguese": self = .portuguese
        case "russian": self = .russian
        case "malaysian": self = .malaysian
        case "polish": self = .polish
        case "american": self = .american
        case "greek": self = .greek
        case "italian": self = .italian
        default: self = .custom(status)
        }
    }
}
