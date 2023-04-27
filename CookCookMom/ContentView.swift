//
//  ContentView.swift
//  CookCookMom
//
//  Created by 김예림 on 2023/04/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("CookCook, Mom!")
            Text("RUbiBUriir")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
