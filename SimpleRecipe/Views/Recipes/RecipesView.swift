//
//  RecipesView.swift
//  SimpleRecipe
//
//  Created by Giuseppe Sapienza on 29/2/2024.
//

import SwiftUI

struct RecipesView: View {
    
    let recipes: [Recipe]
    
    var body: some View {
        NavigationStack {
            List {
                if recipes.isEmpty {
                    ContentUnavailableView {
                        Label("No recipes", systemImage: "fork.knife.circle")
                    } description: {
                        Text("Your recipes will appear here.")
                    }
                    .listRowBackground(Color.clear)
                }
                
                ForEach(recipes, id: \.self) { recipe in
                    recipeRow(recipe)
                }
            }
            .navigationTitle("Recipes")
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailsView(recipe: recipe)
            }
        }
    }
    
    private func recipeRow(_ recipe: Recipe) -> some View {
        NavigationLink(value: recipe) {
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.headline)
                Text(recipe.description)
                    .font(.subheadline)
            }
        }
    }
    
}

#Preview("Mock data") {
    RecipesView(recipes: Recipe.mocks())
}

#Preview("Empty state") {
    RecipesView(recipes: [])
}
