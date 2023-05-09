//
//  TestView.swift
//  CookCookMom
//
//  Created by 박승찬 on 2023/05/08.
//

import SwiftUI

import SwiftUI

struct TestView: View {
    @ObservedObject var viewModel: IngredientsViewModel
    var body: some View {
        ScrollView{
            ForEach(0..<3) { stack in
                HStack{
                    ForEach(stack*3..<stack*3+3,id: \.self) { index in
                        ButtonSample(imageKey: viewModel.ingredientModels[index].imageKey, viewModel: self.viewModel,index: index)
                    }
                }
            }
            Button{
            } label: {
                Text("보내기")
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(viewModel: IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat]))
    }
}

struct ButtonSample: View {
    let imageKey: String
    var viewModel: IngredientsViewModel
    let index: Int
    var body: some View {
        Button {
            viewModel.isIngredientClicked(index: index)
            print(viewModel.ingredientModels[index].isChecked)
        } label: {
            Image(imageKey)
                .resizable()
                .frame(width: 75, height: 75)
        }
        .background(viewModel.ingredientModels[index].isChecked ? Color.blue : Color.white)
        .cornerRadius(25)
    }
}
