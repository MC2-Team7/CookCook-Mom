//
//  SendView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/08.
//

import SwiftUI

struct SendView: View {
    @StateObject var ingredientsViewModel: IngredientsViewModel
    @ObservedObject var peripheral: PeripheralViewModel
    
    var body: some View {
        ZStack{
            Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255)
                .ignoresSafeArea()
            VStack {
                NotificationButton()
                CartView(ingredientsViewModel: ingredientsViewModel)
                    .padding(10)
                Text("아이에게 어떤 재료를 보낼까요?")
                    .font(.title2)
                    .bold()
                    .padding(20)
                ForEach(0..<3) { stack in
                    HStack{
                        ForEach(stack*3..<stack*3+3,id: \.self) { index in
                            IngredientButton(ingredientsViewModel: ingredientsViewModel, index: index)
                        }
                    }
                }
                
                
                Button {
                    peripheral.message = ingredientsViewModel.sendIngredientsMessage()
                    print(peripheral.message)
                    peripheral.isPossibleToSend = true
                    peripheral.isSendingData = true
                    peripheral.switchChanged()
                } label: {
                    Text("재료 보내기")
                        .frame(width: 280, height: 50)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                }
                .alert(isPresented: $peripheral.isSendingData) {
                    Alert(title: Text("전송 완료"), message: Text("재료 전송이 완료되었습니다."), dismissButton: .default(Text("확인")) {
                        peripheral.isPossibleToSend = false
                        peripheral.switchChanged()
                        ingredientsViewModel.resetIngredients()
                    })
                }
                .padding(.top, 15)
                
                //                Button {
                //                    peripheral.message = ingredientsViewModel.sendIngredientsMessage()
                //                    print(peripheral.message)
                //                    peripheral.isPossibleToSend = true
                //                    peripheral.switchChanged()
                //                } label: {
                //                    Text("재료 보내기")
                //                        .frame(width: 280, height: 50)
                //                        .fontWeight(.semibold)
                //                        .foregroundColor(.white)
                //                        .background(Color.blue)
                //                        .cornerRadius(30)
                //                }
                //                .alert(isPresented: $peripheral.isSent) {
                //                    Alert(title: Text("전송 완료"), message: Text("재료 전송이 완료되었습니다."), dismissButton: .default(Text("확인")) {
                //                        peripheral.isPossibleToSend = false
                //                        peripheral.isSent = false
                //                        peripheral.switchChanged()
                //                        ingredientsViewModel.resetIngredients()
                //                    })
                //                }
                //                .padding(.top, 15)
                
                //            Button("보내기"){
                //                peripheral.message = ingredientsViewModel.sendIngredientsMessage()
                //                print(peripheral.message)
                //                peripheral.isPossibleToSend = true
                //                DispatchQueue.main.async {
                //                    peripheral.switchChanged()
                //                }
                //                ingredientsViewModel.resetIngredients()
                //            }
                //            .alert(isPresented: $peripheral.isPossibleToSend) {
                //                Alert(title: Text("전송 완료"), message: Text("재료 전송이 완료되었습니다."), dismissButton: .default(Text("확인")) {
                //                    peripheral.isPossibleToSend = false
                //                    peripheral.switchChanged()
                //                })
                //            }
                
            }
            .onDisappear {
                peripheral.stopAction()
            }
        }
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView(ingredientsViewModel: IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat]), peripheral: PeripheralViewModel())
    }
}
