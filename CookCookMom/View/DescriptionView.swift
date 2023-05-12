//
//  descriptionView.swift
//  CookCookMom
//
//  Created by 김수인 on 2023/05/12.
//

import SwiftUI

struct DescriptionView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("재료 선택하기")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom])
                Text("오늘 할 요리에 들어갈 재료를 선택해주세요")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom])
                
                Text("재료 보내기")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom,.top])
                Text("선택한 재료를 [재료 보내기] 버튼을 눌러 아이에게 보내주세요")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom])
                
                Text("아이와 함께하기")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom,.top])
                Text("재료를 보내고 아이에게 \"오늘 요리 같이해볼래?\" 라고 말해주세요")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom])
                
                Text("아이 칭찬하기")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading,.bottom,.top])
                Text("아이에게 함께 썬 재료를 받으면 아이를 칭찬해주세요")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
            }
                .navigationTitle("이렇게 써보세요!")
                .navigationBarTitleDisplayMode(.large)
            
        }
        
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
