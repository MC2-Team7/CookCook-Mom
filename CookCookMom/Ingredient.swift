//
//  Ingredient.swift
//  CookCookMom
//
//  Created by 김수인 on 2023/05/03.
//

enum Ingredient {
    case carrot, cucumber, fish, garlic, onion, paprika, potato, spinach, sweetPotato
    
    var description: String {
        switch self
        {
        case .carrot:
            return "당근"
        case .cucumber:
            return "오이"
        case .fish:
            return "생선"
        case .garlic:
            return "마늘"
        case .onion:
            return "양파"
        case .paprika:
            return "파프리카"
        case .potato:
            return "감자"
        case .spinach:
            return "시금치"
        case .sweetPotato:
            return "고구마"
        }
    }
    
    var imageName: String {
        switch self
        {
        case .carrot:
            return "carrot"
        case .cucumber:
            return "cucumber"
        case .fish:
            return "fish"
        case .garlic:
            return "garlic"
        case .onion:
            return "onion"
        case .paprika:
            return "paprika"
        case .potato:
            return "potato"
        case .spinach:
            return "spinach"
        case .sweetPotato:
            return "sweetPotato"
        }
    }
}
