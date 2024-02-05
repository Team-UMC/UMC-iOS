//
//  SearchBarNobutton.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct SearchBarNobutton: View {
    
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
                
 
                
            }
            .frame(width: 343,height: 38)
            .foregroundColor(Color("searchPurple"))
            .background(Color(color))
            .cornerRadius(14)
            

            
        }
        .onAppear {
            color = color
        }
    }
}

struct SearchBarNobutton_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarNobutton(text: .constant(""), color: .constant("searchbar"))
    }
}



