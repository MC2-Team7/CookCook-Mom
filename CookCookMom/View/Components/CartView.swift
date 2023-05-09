//
//  CartView.swift
//  CookCookMom
//
//  Created by 김수인 on 2023/05/09.
//

import SwiftUI

struct CartView: View {
    @StateObject var ingredientsViewModel: IngredientsViewModel
    
    var body: some View {
            
        ZStack {
            LazyVGrid(columns: [GridItem(spacing:5), GridItem(spacing:5), GridItem(spacing:5)], alignment: .trailing) {
                ForEach(ingredientsViewModel.ingredientModels) {
                    ingredient in
                    if (ingredient.isChecked) {
                        Image("\(ingredient.imageKey)")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }.frame(width: 90, height: 75)
                .offset(x:-15, y:-48)
                
            Image("shoppingCart")
                    .resizable()
                    .frame(width: 140, height: 140)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(ingredientsViewModel:  IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat]))
    }
}
