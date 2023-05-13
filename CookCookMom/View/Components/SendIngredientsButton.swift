//
//  SendIngredientsButton.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/08.
//

import SwiftUI

struct SendIngredientsButton: View {
    @StateObject var sendViewModel: IngredientsViewModel
    @Binding var sendable: Bool
    
    var body: some View {
        Button(action: {
            
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
        SendIngredientsButton(sendViewModel: IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat]), sendable: .constant(true))
        
       
    }
}
