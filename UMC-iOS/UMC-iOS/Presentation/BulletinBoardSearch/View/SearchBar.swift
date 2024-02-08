//
//  SearchBar.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var color: String
    
    var body: some View {
        HStack {
            //검색창
            HStack {
                Image(systemName: "magnifyingglass")  //돋보기 아이콘
                    .padding(.leading,8)
                    .padding(.trailing,10)
                TextField("글 제목, 내용을 입력해주세요", text: $text) //텍스트 필드
                    .foregroundColor(Color("textColor"))
                    .font(.system(size: 14))
                
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "SearchIcon")
                            .foregroundColor(.purple)
                    }
                } else {
                    EmptyView()
                }
                
                //x버튼
                Button(action: {
                    print("지우기 버튼을 눌렀습니다")
                }) {
                    Image("x")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 14, height: 14)
                        .padding(.leading,13.5)
                        .padding(.trailing,13.5)
                }
                
            }
            .frame(width: 300,height: 38)
            .foregroundColor(Color("searchPurple"))
            .background(Color(color))
            .cornerRadius(14)
            

            
        }
        .onAppear {
            color = color
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), color: .constant("searchbar"))
    }
}


