//
//  descriptionButton.swift
//  CookCookMom
//
//  Created by 김수인 on 2023/05/12.
//

import SwiftUI

struct descriptionButton: View {
    var body: some View {
        Button(action: {print("설명")}) {
            Image(systemName: "info.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
                .padding(.top)
                .padding(.trailing, 300)
        }
    }
}

struct descriptionButton_Previews: PreviewProvider {
    static var previews: some View {
        descriptionButton()
    }
}
