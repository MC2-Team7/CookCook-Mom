//
//  ContentView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/04/27.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var ingredientsViewModel: IngredientsViewModel = IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat])
    @StateObject var peripheral: PeripheralViewModel = PeripheralViewModel()
    var body: some View {
        SendView(ingredientsViewModel: ingredientsViewModel, peripheral: peripheral)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
