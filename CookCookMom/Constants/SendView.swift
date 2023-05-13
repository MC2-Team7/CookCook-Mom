//
//  SendView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/08.
//

import SwiftUI
import Foundation

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

                    
                }
                
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
