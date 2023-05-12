//
//  NotiTestView.swift
//  CookCookMom
//
//  Created by JaeUngJang on 2023/05/09.
//

import SwiftUI

struct NotificationListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    // 1.
    @FetchRequest(
        // 2.
        entity: Item.entity(),
        // 3.
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)
        ]
        //,predicate: NSPredicate(format: "genre contains 'Action'")
        // 4.
    ) var items: FetchedResults<Item>
    
    @State var isPresented = false
    @State var receivedMsg = ["carrot", "mushroom", "fish", "scallion", "onion", "paprika", "potato", "eggplant", "meat"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.ingredientName) {
                    NotificationRowView(notification: $0)
                }
                .onDelete(perform: deleteItem)
            }
            //            .sheet(isPresented: $isPresented) {
            //                AddMovie { title, genre, release in
            //                    self.addMovie(title: title, genre: genre, releaseDate: release)
            //                    self.isPresented = false
            //                }
            //            }
            .navigationBarItems(trailing:
                Button(action: {
                addItem(ingredientName: receivedMsg.randomElement()!, liked: false, timestamp: Date.now)
                }) {
                    Image(systemName: "plus")
                }
            )
            .listStyle(.automatic)
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        // 1.
        offsets.forEach { index in
            // 2.
            let item = self.items[index]
            
            // 3.
            self.managedObjectContext.delete(item)
        }
        
        // 4.
        saveContext()
    }
    
    
    func addItem(ingredientName: String, liked: Bool, timestamp: Date) {
        // 1
        let newItem = Item(context: managedObjectContext)
        
        // 2
        newItem.ingredientName = ingredientName
        newItem.liked = liked
        newItem.timestamp = timestamp
        
        // 3
        saveContext()
    }
    
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
}

struct NotiTestView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}

