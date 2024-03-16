//
//  RecipeDetailsView.swift
//  SimpleRecipe
//
//  Created by Giuseppe Sapienza on 16/3/2024.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    let recipe: Recipe
    
    var body: some View {
        List {
            descriptionSection
            ingredientSection
            stepSections
        }
        .navigationTitle(recipe.title)
    }
    
    private var descriptionSection: some View {
        Section {
            Text(recipe.description)
                .font(.title3)
            HStack {
                Text("Minutes")
                Spacer()
                Text(Duration(secondsComponent: Int64(recipe.time), attosecondsComponent: 0), format: .time(pattern: .minuteSecond))
            }
            .font(.subheadline)
        }
        .listRowBackground(Color.clear)
    }
    
    private var ingredientSection: some View {
        Section {
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                HStack {
                    Text(ingredient.name)
                    Spacer()
                    Text(ingredient.quantity)
                }
            }
        } header: {
            Text("Ingredients")
        }
    }
    
    private var stepSections: some View {
        Section {
            ForEach(recipe.steps, id: \.self) { step in
                Text(step.description)
            }
        } header: {
            Text("Steps")
        }
    }
}

#Preview {
    NavigationStack {
        RecipeDetailsView(recipe: Recipe.mocks()[0])
    }
}
