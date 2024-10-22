//
//  APIRequestDispatcher.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import Foundation

enum APIRequestError: Error {
    case badUrl
}

final class APIRequestDispatcher {
    class func request<T: Decodable & Sendable>(apiRouter: APIRouter) async throws -> T {
        var components = URLComponents()
        components.host = apiRouter.host
        components.path = apiRouter.path
        components.scheme = "https"
        
        guard let url = components.url else { throw APIRequestError.badUrl }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method

        let session = URLSession(configuration: .default)
        
        let (data, _) = try await session.data(for: urlRequest)

        return try JSONDecoder().decode(T.self, from: data)
    }
}
