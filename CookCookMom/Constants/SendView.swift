//
//  SendView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/05/08.
//

import SwiftUI
import CloudKit

class CloudKitPushNotificationViewModel: ObservableObject {
    func requestNotiPermision() {
        let option: UNAuthorizationOptions = [.alert,.sound,.badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: option) { success, error in
            if let error = error {
                print(error)
            } else if success {
                print("notification permissions success!")
                DispatchQueue.main.sync {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("notification permissions failure!")
            }
            
        }
    }
    
    func subscribeToNoti() {
        let predicate = NSPredicate(value: true)
        let subscription = CKQuerySubscription(recordType: "CD_ChoppedIngredient", predicate: predicate, subscriptionID: "ChoppedIngredient_added_to_database", options: .firesOnRecordCreation )
        let notification = CKSubscription.NotificationInfo()
        notification.title = "아이가 재료를 손질해서 보냈어요!"
        notification.alertBody = "아이에게 칭찬의 한마디 부탁드립니다 :)"
        notification.soundName = "default"
        
        subscription.notificationInfo = notification
        
        CKContainer.default().privateCloudDatabase.save(subscription) { returnedSubscription, returnedError in
            if let error = returnedError {
                print(error)
            } else {
                print("Successfully subscribed to notifications!")
            }
            
        }
    }
}

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


    @ObservedObject var ingredientsViewModel: IngredientsViewModel
    
    @State private var showModal = false
    @State private var showingAlert = false
   
    @StateObject private var vm = CloudKitPushNotificationViewModel()

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
                        .onAppear{
                            vm.requestNotiPermision()
                            vm.subscribeToNoti()
                        }
                        
                        
                        NavigationLink {
                            NotificationListView()
                        } label: {
                            if ingredientsViewModel.newNoti {
                                Image(systemName: "bell.badge.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.red,.black)
                                    .padding(.top)
                                    .padding(.leading, 250)
                            } else {
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                                    .padding(.top)
                                    .padding(.leading, 250)
                            }
                        }.simultaneousGesture(TapGesture().onEnded{
                            ingredientsViewModel.checkNotification()
                        })
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
                        showingAlert = true
                    } label: {
                        Text("재료 보내기")
                            .frame(width: 280, height: 50)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(30)
                    }
                    .padding(.top, 15)
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text("아이에게 재료를 보냈습니다😄"),
                              message: Text("아이에게 보냈다고 알려주세요~"))
                    })
                    

                    
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
        SendView(ingredientsViewModel: IngredientsViewModel(ingredientModels: [.carrot,.mushroom,.fish,.scallion,.onion,.paprika,.potato,.eggplant,.meat]))
    }
}
