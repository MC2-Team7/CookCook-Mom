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
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 dd일"
        return formatter
    } ()
    
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        formatter.timeStyle = .short
        return formatter
    } ()
    
    
    
    func EngToKor(eng:String?) -> (String?, String?) {
        switch eng {
        case "carrot":
            return ("🥕", "당근을")
        case "mushroom":
            return ("🍄", "버섯을")
        case "fish":
            return ("🐟", "생선을")
        case "scallion":
            return ("🧪", "대파를")
        case "onion":
            return ("🧅", "양파를")
        case "paprika":
            return ("🫑", "파프리카를")
        case "potato":
            return ("🥔", "감자를")
        case "eggplant":
            return ("🍆", "가지를")
        case "meat":
            return ("🥩", "고기를")
        default:
            return ("", "")
        }
    }
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
//                notification.ingredientName.map(Text.init)
//                    .font(.body)
//                EngToKor(eng: notification.ingredientName).map(Text.init)
                
                var sentence: (String?, String?) = EngToKor(eng: notification.ingredientName)
                Text("\(sentence.0!) 아이가 \(sentence.1!) 썰어 보냈습니다.")
                    .padding(1)
                    
                
                HStack {
//                    Text("\(notification.timestamp!, formatter: NotificationRowView.releaseFormatter)")
                    let a = notification.timestamp
                    
                    notification.timestamp.map { Text(Self.dateFormatter.string(from: $0)) }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    notification.timestamp.map { Text(Self.timeFormatter.string(from: $0)) }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Image(systemName: "heart")
        }

    }
}

//struct NotiRowTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationRowView()
//    }
//}
