//
//  IngredientButton.swift
//  selectIngredient
//
//  Created by 김수인 on 2023/05/01.
//

import SwiftUI

struct IngredientButton: View {
    @StateObject var ingredientsViewModel: IngredientsViewModel
    @StateObject var peripheral: PeripheralViewModel = PeripheralViewModel()
    var index: Int

    
    var body: some View {
        let ingredient = ingredientsViewModel.ingredientModels[index]
        VStack {
            Button {
                ingredientsViewModel.isIngredientClicked(index: index)
//                peripheral.isPossibleToSend = false
            } label: {
                Image(ingredient.imageKey)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(15)
                    .background(ingredient.isChecked ? Color.blue : Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            Text(ingredient.name)
        }
    }
}

struct IngredientButton_Previews: PreviewProvider {
    static var previews: some View {
        IngredientButton(ingredientsViewModel: IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat]), index: 0)
    }
}
