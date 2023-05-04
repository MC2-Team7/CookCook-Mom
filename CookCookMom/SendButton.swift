//
//  SendButton.swift
//  selectIngredient
//
//  Created by 김수인 on 2023/05/01.
//

import SwiftUI

struct SendButton: View {
    @State private var showingAlert = false
    @Binding var selectedIngredients: [Ingredient]
    
    var body: some View {
        VStack {
            Button(action: {
                showingAlert = true
                print("재료를 보냈습니다.")
                
                for selectedIngredient in selectedIngredients {
                    print(selectedIngredient.description)
                }
            }, label: {
                Text("재료 보내기!")
                    .frame(width: 380, height: 30)
                    .font(.title2)
            })
            //.alert(isPresented: $showingAlert, content: {
            //    Alert(title: Text("애기한테 보낼 String: "),
            //          message: Text("\(selectedIngredients[0].description)"))
            //})
            .disabled(selectedIngredients.count > 0 ? false : true)
            .buttonStyle(.borderedProminent)
        }
    }
}

//struct SendButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SendButton()
//    }
//}
