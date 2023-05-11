//
//  SendView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/08.
//

import SwiftUI

struct SendView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \RawIngredients.timestamp, ascending: true)],
        animation: .default)
    private var rawIngredients: FetchedResults<RawIngredients>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ChoppedIngredient.timestamp, ascending: true)],
        animation: .default)
    private var choppedIngredients: FetchedResults<ChoppedIngredient>


    @StateObject var ingredientsViewModel: IngredientsViewModel
    @StateObject var peripheral: PeripheralViewModel
    
    var body: some View {
        ZStack{
            Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255)
                .ignoresSafeArea()
            VStack {
//                NotificationButton()
//                CartView(ingredientsViewModel: ingredientsViewModel)
//                    .padding(10)
//                Text("아이에게 어떤 재료를 보낼까요?")
//                    .font(.title2)
//                    .bold()
//                    .padding(20)
                
                List{
                    Text("리스트")
                    ForEach(rawIngredients) { item in
                        Text(item.ingredients!)
                    }
                }
//                List {
//                    ForEach(rawIngredients) { item in
//                        NavigationLink {
//                            Text("Raw Ingredient at \(item.timestamp!, formatter: itemFormatter)")
//                        } label: {
//                            VStack {
//                                Text("\(item.ingredients!)")
//                                Text(item.timestamp!, formatter: itemFormatter)
//                            }
//                        }
//                    }
//                    .onDelete(perform: deleteRawIngredients)
//                }
//                .toolbar {
//                    ToolbarItemGroup(placement: .navigationBarTrailing) {
//                        EditButton()
//                    }
//                }
                ForEach(0..<3) { stack in
                    HStack{
                        ForEach(stack*3..<stack*3+3,id: \.self) { index in
                            IngredientButton(ingredientsViewModel: ingredientsViewModel, index: index)
                        }
                    }
                }
                
                
                Button {
//                    peripheral.message = ingredientsViewModel.sendIngredientsMessage()
//                    print(peripheral.message)
//                    peripheral.isPossibleToSend = true
//                    peripheral.switchChanged()
                    addRawIngredients(sendText: ingredientsViewModel.sendIngredientsMessage())
                    
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
    
    private func addRawIngredients(sendText: String) {
        withAnimation {
            let newItem = RawIngredients(context: viewContext)
            newItem.timestamp = Date()
            newItem.ingredients = sendText

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteRawIngredients(offsets: IndexSet) {
        withAnimation {
            offsets.map { rawIngredients[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView(ingredientsViewModel: IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat]), peripheral: PeripheralViewModel())
    }
}
