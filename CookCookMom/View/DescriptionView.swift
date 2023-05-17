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
                    HStack {
                        Image("clickCarrot")
                            .resizable()
                            .frame(width: 111.31, height: 125.49)
                            .padding(.leading)
                        VStack {
                            Text("재료 선택하기")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading,.top,.bottom])
                            Text("오늘 할 요리에 들어갈 재료를 선택해주세요.")
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading,.bottom])
                                .foregroundColor(.secondary)
                        }
                        
                    }
                    
                    HStack {
                        VStack {
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
                                .foregroundColor(.secondary)
                        }
                        Button {
                        } label: {
                            Text("재료 보내기")
                                .frame(width: 150, height: 46.3)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(30)
                        }.padding(.trailing)
                    }
                    
                    HStack {
                        Image("momKid")
                            .resizable()
                            .frame(width: 81.39, height: 94)
                            .padding(.leading)
                        VStack {
                            Text("아이와 함께하기")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading,.bottom,.top])
                            Text("재료를 보내고 아이에게 \n\"오늘 요리 같이 해볼래?\" \n라고 말해주세요.")
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading,.bottom])
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    HStack {
                        VStack {
                            Text("아이 칭찬하기")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading,.bottom,.top])
                            Text("아이가 손질한 재료를 받으면 아이를 칭찬해주세요❤️")
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .foregroundColor(.secondary)
                        }
                        Image("hands")
                            .resizable()
                            .frame(width: 120.25, height: 91)
                            .padding(.trailing)
                    }
                    
                    
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
