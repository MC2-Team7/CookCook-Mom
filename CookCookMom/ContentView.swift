//
//  ContentView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/04/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: CentralView()) {
                    Text("Central")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                NavigationLink(destination: PeripheralView()) {
                    Text("Peripharal")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
