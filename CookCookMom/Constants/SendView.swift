//
//  SendView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/08.
//

import SwiftUI

struct SendView: View {
    @StateObject var ingredientsViewModel: IngredientsViewModel
    @StateObject var peripheral: PeripheralViewModel
    
    var body: some View {
        VStack {
            NotificationButton()
            ForEach(0..<3) { stack in
                HStack{
                    ForEach(stack*3..<stack*3+3,id: \.self) { index in
                        IngredientButton(ingredientsViewModel: ingredientsViewModel, index: index)
                    }
                }
            }
            SendIngredientsButton(sendViewModel: IngredientsViewModel(ingredientModels: ingredientsViewModel.ingredientModels), sendable: $ingredientsViewModel.canSend)
        }
        .onDisappear {
            peripheral.stopAction()
        }
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView(ingredientsViewModel: IngredientsViewModel(ingredientModels: [.carrot,.cucumber,.fish,.garlic,.onion,.paprika,.potato,.spinach,.sweetPotato]), peripheral: PeripheralViewModel())
    }
}
