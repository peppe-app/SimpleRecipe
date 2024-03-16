//
//  Recipe.swift
//  SimpleRecipe
//
//  Created by Giuseppe Sapienza on 29/2/2024.
//

import Foundation

struct Recipe: Hashable {
    var title: String
    var description: String
    /// time in seconds
    var time: TimeInterval
    
    var ingredients: [Ingredient]
    var steps: [RecipeStep]
    
    var canBeSaved: Bool {
        !title.isEmpty
        && !description.isEmpty
        && !ingredients.isEmpty
        && !steps.isEmpty
    }
    
    init(
        title: String,
        description: String,
        time: TimeInterval,
        ingredients: [Ingredient],
        steps: [RecipeStep]
    ) {
        self.title = title
        self.description = description
        self.time = time
        self.steps = steps
        self.ingredients = ingredients
        self.steps = steps
    }
    
    init() {
        self.title = ""
        self.description = ""
        self.time = 0
        self.ingredients = []
        self.steps = []
    }
}

struct Ingredient: Hashable {
    var name: String
    var quantity: String
}

struct RecipeStep: Hashable {
    var description: String
}
