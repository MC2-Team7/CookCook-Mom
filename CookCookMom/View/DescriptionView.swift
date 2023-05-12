//
//  descriptionView.swift
//  CookCookMom
//
//  Created by 김수인 on 2023/05/12.
//

import SwiftUI

struct DescriptionView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("재료 선택하기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading,.bottom])
                    Text("오늘 할 요리에 들어갈 재료를 손질할 순서대로 선택해주세요.")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading,.bottom])
                    
                    Text("재료 보내기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading,.bottom,.top])
                    Text("선택한 재료를 [재료 보내기] 버튼을 눌러 아이에게 보내주세요.")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading,.bottom])
                    
                    Text("아이와 함께하기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading,.bottom,.top])
                    Text("재료를 보내고 아이에게 \"오늘 요리 같이 해볼래?\" 라고 말해주세요. 그리고 아이용 앱에서 흔들리는 알림 아이콘을 누르게 유도해주세요.")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading,.bottom])
                    
                    Text("아이가 손질한 재료 받기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading,.bottom,.top])
                    Text("아이가 재료를 다 손질하면 보내기 버튼을 눌러 부모에게 보낼 수 있도록 알려주세요.")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    Text("아이 칭찬하기")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading,.bottom,.top])
                    Text("아이가 손질한 재료를 받으면 아이를 칭찬해주세요❤️ \n\n그 외의 역할놀이에도 사용해도 좋습니다")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                }//VStack
                .navigationTitle("이렇게 써보세요!")
                .navigationBarTitleDisplayMode(.large)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {self.presentationMode.wrappedValue.dismiss()}) {Image(systemName: "xmark")
                                .foregroundColor(.black)
                        }
                    }
                    
                }
//                .onTapGesture {
//                    self.presentationMode.wrappedValue.dismiss()
//                }
            }
        }//ScrollView
    }//NavigationView
}
//
//struct DescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionView()
//    }
//}
