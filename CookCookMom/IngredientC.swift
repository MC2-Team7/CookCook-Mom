//
//  IngredientC.swift
//  CookCookMom
//
//  Created by 김수인 on 2023/05/03.
//

import Foundation

class IngredientC: Hashable {

    var ingredientName: String
    var image: String
    var checked: Bool
    
    init(ingredient: String, image: String, checked: Bool) {
        self.ingredientName = ingredient
        self.image = image
        self.checked = checked
    }
    
    func getIngredient() -> String {
        return self.ingredientName
    }
    
    func getImage() -> String {
        return self.image
    }  
    
    static func == (lhs: IngredientC, rhs: IngredientC) -> Bool {
        return lhs.ingredientName == rhs.ingredientName && lhs.image == rhs.image && lhs.checked == rhs.checked
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredientName)
        hasher.combine(image)
        hasher.combine(checked)
    }

}

extension IngredientC {
    static let carrot = IngredientC(
        ingredient: "당근",
        image: "carrot",
        checked: false
    )
    static let cucumber = IngredientC(
        ingredient: "오이",
        image: "cucumber",
        checked: false
    )
    static let fish = IngredientC(
        ingredient: "생선",
        image: "fish",
        checked: false
    )
    static let garlic = IngredientC(
        ingredient: "마늘",
        image: "garlic",
        checked: false
    )
    static let onion = IngredientC(
        ingredient: "양파",
        image: "onion",
        checked: false
    )
    static let paprika = IngredientC(
        ingredient: "파프리카",
        image: "paprika",
        checked: false
    )
    static let potato = IngredientC(
        ingredient: "감자",
        image: "potato",
        checked: false
    )
    static let spinach = IngredientC(
        ingredient: "시금치",
        image: "spinach",
        checked: false
    )
    static let sweetPotato = IngredientC(
        ingredient: "고구마",
        image: "sweetPotato",
        checked: false
    )
}
