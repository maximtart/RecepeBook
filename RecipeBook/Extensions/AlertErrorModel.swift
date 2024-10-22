//
//  AlertErrorModel.swift
//  RecipeBook
//
//  Created by Maxim on 18.10.2024.
//

import Foundation

final class AlertErrorModel: Identifiable {
    var id: Int { code }
    
    var code: Int
    var description: String
    
    init(code: Int, description: String) {
        self.code = code
        self.description = description
    }
    
    init(error: Error) {
        code = (error as NSError).code
        description = error.localizedDescription
    }
}
