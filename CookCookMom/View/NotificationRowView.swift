//
//  NotiRowTestView.swift
//  CookCookMom
//
//  Created by JaeUngJang on 2023/05/09.
//

import SwiftUI
import CoreData

struct NotificationRowView: View {
    
    let notification: Item
    
    static let releaseFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter
    } ()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                notification.ingredientName.map(Text.init)
                    .font(.body)
                HStack {
                    notification.timestamp.map { Text(Self.releaseFormatter.string(from: $0)) }
                      .font(.caption)
                }
            }
            Spacer()
            Image(systemName: "heart")
        }

    }
}

//struct NotiRowTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotiRowTestView()
//    }
//}
