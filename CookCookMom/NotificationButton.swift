//
//  NotificationButton.swift
//  selectIngredient
//
//  Created by 김수인 on 2023/05/02.
//

import SwiftUI

struct NotificationButton: View {
    var body: some View {
        VStack {
            Button(action: {
                print("알림")
                
            }){
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                    .padding(.top)
                    .padding(.leading, 300)
            }
        }
        
    }
}

struct NotificationButton_Previews: PreviewProvider {
    static var previews: some View {
        NotificationButton()
    }
}
