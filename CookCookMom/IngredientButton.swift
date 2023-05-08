//
//  IngredientButton.swift
//  selectIngredient
//
//  Created by 김수인 on 2023/05/01.
//

import SwiftUI

struct IngredientButton: View {
    @State private var buttonTapped = false
    @Binding var selectedIngredients: [Ingredient]
    
    var ingredient: Ingredient
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                }) {
                    Text("")
                        .frame(width: 100, height: 100)
                }
                Image(ingredient.imageName)
                    .resizable()
                    .frame(width: 75, height: 75)
            }
            .onTapGesture {
                if !buttonTapped {
                    selectedIngredients.append(ingredient)
                    buttonTapped.toggle()
                } else {
                    selectedIngredients.remove(at: selectedIngredients.firstIndex(of: ingredient)!)
                    buttonTapped.toggle()
                }
            }
            .background(buttonTapped ? Color.blue : Color.white)
            .cornerRadius(25)
            
            Text("\(ingredient.description)")
            
        }
    }
}

//struct IngredientButton_Previews: PreviewProvider {
//    static var previews: some View {
////        IngredientButton(selectedIngredients: , ingredient: Ingredient.carrot)
//        IngredientButton(ingredient: .carrot)
//    }
//}
