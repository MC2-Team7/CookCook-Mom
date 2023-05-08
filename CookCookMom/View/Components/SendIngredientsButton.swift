//
//  SendIngredientsButton.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/08.
//

import SwiftUI

struct SendIngredientsButton: View {
    @StateObject var peripheral: PeripheralViewModel = PeripheralViewModel()
    @StateObject var sendViewModel: IngredientsViewModel
    @Binding var sendable: Bool
    
    var body: some View {
        Button(action: {
            peripheral.message = sendViewModel.sendIngredientsMessage()
            print(peripheral.message)
            peripheral.isPossibleToSend = sendable
        }) {
            Text("재료 보내기")
                .frame(width: 280, height: 50)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(30)
        }
    }
}

struct SendIngredientsButton_Previews: PreviewProvider {
    static var previews: some View {
        SendIngredientsButton(sendViewModel: IngredientsViewModel(ingredientModels: [.carrot,.cucumber,.fish,.garlic,.onion,.paprika,.potato,.spinach,.sweetPotato]), sendable: .constant(true))
        
       
    }
}
