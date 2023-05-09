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
        imageKey: "carrot2D",
        isChecked: false
    )
    static let mushroom = IngredientModel(
        name: "버섯",
        imageKey: "mushroom2D",
        isChecked: false
    )
    static let fish = IngredientModel(
        name: "생선",
        imageKey: "fish2D",
        isChecked: false
    )
    static let scallion = IngredientModel(
        name: "대파",
        imageKey: "scallion2D",
        isChecked: false
    )
    static let onion = IngredientModel(
        name: "양파",
        imageKey: "onion2D",
        isChecked: false
    )
    static let paprika = IngredientModel(
        name: "파프리카",
        imageKey: "paprika2D",
        isChecked: false
    )
    static let potato = IngredientModel(
        name: "감자",
        imageKey: "potato2D",
        isChecked: false
    )
    static let eggplant = IngredientModel(
        name: "가지",
        imageKey: "eggplant2D",
        isChecked: false
    )
    static let meat = IngredientModel(
        name: "고기",
        imageKey: "meat2D",
        isChecked: false
    )

}
