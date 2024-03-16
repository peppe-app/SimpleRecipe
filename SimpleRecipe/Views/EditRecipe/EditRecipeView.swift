//
//  EditRecipeView.swift
//  SimpleRecipe
//
//  Created by Giuseppe Sapienza on 29/2/2024.
//

import SwiftUI

struct EditRecipeView: View {
    
    @State private var recipe = Recipe()
    
    @State private var editIngredient: Ingredient?
    @State private var editStep: RecipeStep?
    
    private(set) var onEdit: (Recipe) -> ()
    
    var body: some View {
        NavigationStack {
            Form {
                infoSection
                descriptionSection
                ingredientsListSection
                stepsListSection
            }
            .navigationTitle("New Recipe")
            .toolbar {
                Button("Save", action: saveRecipe)
            }
        }
    }
    
    private var infoSection: some View {
        Section {
            TextField("Title", text: $recipe.title)
        } header: {
            Text("Info")
        }
    }
    
    private var descriptionSection: some View {
        Section {
            TextEditor(text: $recipe.description)
                .frame(minHeight: 80, maxHeight: 150)
        } header: {
            Text("Description")
        }
    }
    
    private var ingredientsListSection: some View {
        Section {
            
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                HStack {
                    Text(ingredient.name)
                    Spacer()
                    Text(ingredient.quantity)
                }
            }
            .onDelete(perform: deleteIngredient(at:))
            
            if editIngredient == nil {
                let title = recipe.ingredients.isEmpty 
                    ? "Add your first ingredient"
                    : "Add ingredient"
                Button(title, action: addEmptyIngredient)
            }
            
            if editIngredient != nil {
                TextField("Name", text: Binding(
                    get: { self.editIngredient?.name ?? "" },
                    set: { self.editIngredient?.name = $0 }
                ))
                TextField("Quantity", text: Binding(
                    get: { self.editIngredient?.quantity ?? "" },
                    set: { self.editIngredient?.quantity = $0 }
                ))
                
                Button("Add", action: saveNewIngredient)
                    .disabled(editIngredient?.name.isEmpty ?? true)
            }
        } header: {
            Text("Ingredients")
        }
    }
    
    private var stepsListSection: some View {
        Section {
            if editStep == nil {
                let title = recipe.steps.isEmpty
                ? "Add your first step"
                : "Add step"
                Button(title, action: addEmptyIngredient)
            }
        } header: {
            Text("Steps")
        }
    }
    
    private func saveRecipe() {
        onEdit(recipe)
        
        recipe = Recipe()
    }
    
    private func addEmptyIngredient() {
        editIngredient = Ingredient(name: "", quantity: "")
    }
    
    private func addEmptyStep() {
        editStep = RecipeStep(description: "")
    }
    
    private func saveNewIngredient() {
        guard let editIngredient else { return }
        
        recipe.ingredients.append(editIngredient)
        self.editIngredient = nil
    }
    
    private func deleteIngredient(at offset: IndexSet) {
        recipe.ingredients.remove(atOffsets: offset)
    }

}

#Preview {
    EditRecipeView { recipe in
        
    }
}
