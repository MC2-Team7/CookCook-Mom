import Foundation
import Combine

class IngredientsButtonViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = {
        let names = ["당근", "오이", "양파"]
        return names.map { Ingredient(name: $0, isChecked: false) }
    }()

    @Published var message: String = ""

    var clickedButtonNames: [String] {
        ingredients.filter { $0.isChecked }.map { $0.name }
    }

    func updateButton(_ button: Ingredient) {
        guard let index = ingredients.firstIndex(where: { $0.name == button.name }) else {
            return
        }
        ingredients[index] = button
        message = clickedButtonNames.joined(separator: " ")
    }
}

