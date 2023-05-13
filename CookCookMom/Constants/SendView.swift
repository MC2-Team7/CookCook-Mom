//
//  SendView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/08.
//

import SwiftUI
import Foundation

struct SendView: View {
    @StateObject var ingredientsViewModel: IngredientsViewModel
    @StateObject var peripheral: PeripheralViewModel
    @State private var showModal = false
    @Environment(\.presentationMode) var presentationMode
    @State var isLoading: Bool = true
    
    
    var body: some View {
        ZStack {
        NavigationView {
            ZStack{
                Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Button(action: { self.showModal = true}){ Image(systemName: "info.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                                .padding([.top,.trailing])
                        }.sheet(isPresented: self.$showModal) {
                            DescriptionView()
                        }
                
                        NavigationLink {
                            NotificationListView()
                        } label: {
                            Image(systemName: "bell.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                                .padding(.top)
                                .padding(.leading, 250)
                        }
                    }
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
                        peripheral.switchChanged()
                    } label: {
                        Text("재료 보내기")
                            .frame(width: 280, height: 50)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(30)
                    }
                    .alert(isPresented: $peripheral.isSent) {
                        Alert(title: Text("전송 완료"), message: Text("재료 전송이 완료되었습니다."), dismissButton: .default(Text("확인")) {
                            peripheral.isPossibleToSend = false
                            peripheral.isSent = false
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
            // Launch Screen
            if isLoading {
                launchScreenView
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: { isLoading.toggle()
            })
        }
    }
}

extension SendView {
    var launchScreenView: some View {
        ZStack(alignment: .center) {
            Image("LaunchScreenImage").ignoresSafeArea(.all)
        }
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView(ingredientsViewModel: IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat]), peripheral: PeripheralViewModel())
    }
}
