//
//  CookCookMomApp.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/04/27.
//

import SwiftUI

@main
struct CookCookMomApp: App {
    
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
