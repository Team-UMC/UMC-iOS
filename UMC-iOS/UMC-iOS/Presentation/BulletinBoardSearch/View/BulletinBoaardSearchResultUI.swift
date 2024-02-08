//
//  BulletinBoaardSearchResultUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct BulletinBoaardSearchResultUI: View {
    @State private var searchText = ""
    @State private var searchColor = "barSecond"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    SearchBar(text: $searchText, color: $searchColor)
                        .padding(.top, 20)
                        .padding(.leading,-10)
                    Button("취소") {
                        print("취소버튼을 눌렀습니다")
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.system(size: 14))
                    .padding(.top, 20)
                    .padding(.leading,8)
                    .foregroundColor(Color("textColor"))
                    .background(.clear)
                }
                // 게시글 리스트
                BulletinBoardList()
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
            }
        }
        .background(Color("searchbar").edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct BulletinBoaardSearchResultUI_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoaardSearchResultUI()
    }
}
#endif


