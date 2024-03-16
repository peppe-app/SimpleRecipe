
import SwiftUI

struct ContentView: View {
    
    @State private var recipes: [Recipe] = []
    
    var body: some View {
        TabView {
            RecipesView(recipes: recipes)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            EditRecipeView(
                onEdit: onEditRecipe(_:)
            )
            .tabItem {
                Label("New Recipe", systemImage: "plus.circle.fill")
            }
        }
    }
    
    private func onEditRecipe(_ recipe: Recipe) {
        recipes.append(recipe)
    }
}

#Preview {
    ContentView()
}
