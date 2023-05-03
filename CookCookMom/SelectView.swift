//
//  SelectView.swift
//  selectIngredient
//
//  Created by 김수인 on 2023/05/01.
//

import SwiftUI

struct SelectView: View {
    
//    var ingredients: [IngredientC] =  [.carrot, .onion, .cucumber, .fish, .garlic]

    @State var ingredients: [Ingredient] = [.carrot, .onion, .cucumber, .fish, .garlic, .paprika, .potato, .spinach, .sweetPotato]
    
    @State var selectIngredients: [Ingredient] = []
    
    var body: some View {
        ZStack{
            Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255)
                .ignoresSafeArea()
            VStack {
                NotificationButton()
                    .padding()
//                Text("Bonebayo")
//                    .foregroundColor(.blue)
//                    .bold()
//                    .padding()
                Text("아이에게 어떤 음식을 보낼까요?")
                    .font(.title2)
                    .bold()
                    .padding()
//                ShoppingCart()
//                    .padding()
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem(),GridItem()]) {
                        ForEach(ingredients, id: \.self) {
                            ingredient in
                            IngredientButton(
                                selectedIngredients: $selectIngredients, ingredient: ingredient)
                        }
                    }
                }
                SendButton(selectedIngredients: $selectIngredients)
            }.padding()
        }
    }
}


struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
