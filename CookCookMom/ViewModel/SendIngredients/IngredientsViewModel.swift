//
//  TestViewModel.swift
//  CookCookMom
//
//  Created by 박승찬 on 2023/05/08.
//

import Foundation
import CloudKit

class IngredientsViewModel : ObservableObject {
    @Published var ingredientModels : [IngredientModel]
    @Published var sendMessage: String = ""
    @Published var canSend: Bool = false
    @Published var newNoti: Bool = false
    
    var clickCount: Int = 0 {
        didSet {
            if clickCount > 0 {
                canSend = true
            } else {
                canSend = false
            }
        }
    }
    
    init(ingredientModels : [IngredientModel]){
        self.ingredientModels = ingredientModels
    }
    
    
    // 재료 선택 확인 함수
    func isIngredientClicked(index: Int) {
        self.ingredientModels[index].isChecked = !self.ingredientModels[index].isChecked
        if self.ingredientModels[index].isChecked {
            clickCount += 1
        } else {
            clickCount -= 1
        }
    }
    
    // 선택된 재료 보내기
    func sendIngredientsMessage() -> String {
        sendMessage = ""
        for ingredient in ingredientModels {
            if ingredient.isChecked {
                sendMessage.append(ingredient.name)
                sendMessage.append(" ")
            }
        }
        return sendMessage
    }
    
    func resetIngredients() {
        for index in ingredientModels.indices {
            ingredientModels[index].isChecked = false
        }
        clickCount = 0
    }
    
    //알람 확인 함수
    func checkNotification() {
        self.newNoti = false
    }
    
    //새로운 알람 올 경우
    func newNotification() {
        self.newNoti = true
    }
    
}
