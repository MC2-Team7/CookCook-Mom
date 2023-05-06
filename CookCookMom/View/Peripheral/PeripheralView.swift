//
//  PeripheralView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/06.
//

import SwiftUI

struct PeripheralView: View {
    @StateObject var  ingredientsViewModel = IngredientsButtonViewModel()
    @StateObject var peripheral: PeripheralViewModel = PeripheralViewModel()
    var body: some View {
        VStack {
            
            
            ForEach(ingredientsViewModel.ingredients.indices, id: \.self) { index in
                let button = ingredientsViewModel.ingredients[index]
                Button {
                    let clickedButton = Ingredient(name: button.name, isChecked: !button.isChecked)
                    ingredientsViewModel.updateButton(clickedButton)
                    print(button.name)
                    print(ingredientsViewModel.clickedButtonNames)
                } label: {
                    Text(button.name)
                        .foregroundColor(button.isChecked ? .blue : .black)
                }
                
            }
            Button("보내기") {
                peripheral.message = ingredientsViewModel.message
                print(ingredientsViewModel.message)
                peripheral.isPossibleToSend = true
            }
            .padding()
            .disabled(ingredientsViewModel.clickedButtonNames.isEmpty)
            .onChange(of: peripheral.isPossibleToSend) { newValue in
                if newValue {
                    DispatchQueue.main.async {
                        peripheral.switchChanged()
                    }
                }
            }
            
            
        }
        .onDisappear {
            peripheral.stopAction()
        }
        
    }
}

struct PeripheralView_Previews: PreviewProvider {
    static var previews: some View {
        PeripheralView()
    }
}
