//
//  Model.swift
//  CookCookMom
//
//  Created by 박승찬 on 2023/05/08.
//

import Foundation

class IngredientModel: Identifiable {
    let name: String
    let imageKey: String
    var isChecked: Bool

    init(name: String, imageKey: String, isChecked: Bool) {
        self.name = name
        self.imageKey = imageKey
        self.isChecked = isChecked
    }
}

extension IngredientModel {
    static let carrot = IngredientModel(
        name: "당근",
        imageKey: "carrot",
        isChecked: false
    )
    static let cucumber = IngredientModel(
        name: "오이",
        imageKey: "cucumber",
        isChecked: false
    )
    static let fish = IngredientModel(
        name: "생선",
        imageKey: "fish",
        isChecked: false
    )
    static let garlic = IngredientModel(
        name: "마늘",
        imageKey: "garlic",
        isChecked: false
    )
    static let onion = IngredientModel(
        name: "양파",
        imageKey: "onion",
        isChecked: false
    )
    static let paprika = IngredientModel(
        name: "파프리카",
        imageKey: "paprika",
        isChecked: false
    )
    static let potato = IngredientModel(
        name: "감자",
        imageKey: "potato",
        isChecked: false
    )
    static let spinach = IngredientModel(
        name: "시금치",
        imageKey: "spinach",
        isChecked: false
    )
    static let sweetPotato = IngredientModel(
        name: "고구마",
        imageKey: "sweetPotato",
        isChecked: false
    )

}
