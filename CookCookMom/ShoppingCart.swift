//
//  ShoppingCart.swift
//  CookCookMom
//
//  Created by 김수인 on 2023/05/02.
//

import SwiftUI

struct ShoppingCart: View {
    var body: some View {
        Image("shoppingCart")
            .resizable()
            .frame(width: 150, height: 150)
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}
