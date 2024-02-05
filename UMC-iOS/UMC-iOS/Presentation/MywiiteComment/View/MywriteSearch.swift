//
//  MyWriteSearch.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct MyWriteSearch: View {
    @State private var searchText = ""
    @State private var searchColor = "#F6F6F6"
    var body: some View {
        VStack {
            HStack{
                SearchBar(text: $searchText, color: $searchColor)
                    .padding(.top, 20)
                    .onTapGesture {
                        hideKeyboard()
                    }
                Button("취소") {
                    print("취소버튼을 눌렀습니다")
                }
                .font(.system(size: 14))
                .padding(.top, 20)
                .padding(.leading,8)
                .foregroundColor(Color("textColor"))
                .background(.clear)
            }
            Spacer()
            
            MyContentList()
                .padding(.top,-10)
                .padding(.leading,15)
                .padding(.trailing,0)
        }
    }
}

struct MyWriteSearch_Previews: PreviewProvider {
    static var previews: some View {
        MyWriteSearch()
    }
}


