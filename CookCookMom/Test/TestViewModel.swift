//
//  TestViewModel.swift
//  CookCookMom
//
//  Created by 박승찬 on 2023/05/08.
//

import Foundation

class TestViewModel : ObservableObject {
    @Published var ingredientModels : [IngredientModel]
    init(ingredientModels : [IngredientModel]){
        self.ingredientModels = ingredientModels
    }
    func clickedBtn(index: Int) {
        self.ingredientModels[index].isChecked = !self.ingredientModels[index].isChecked
//        for i in 0..<ingredientModels.count{
//            if self.ingredientModels[i].imageKey == imageKey {
//                self.ingredientModels[i].isChecked = !self.ingredientModels[i].isChecked
//            }
//        }
    }
    func sendBtn() {
        for i in ingredientModels {
            if i.isChecked {
                print(i.name)
            }
        }
    }
    
}
