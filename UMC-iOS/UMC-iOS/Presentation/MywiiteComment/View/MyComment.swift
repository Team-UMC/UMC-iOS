//
//  MyComment.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct MyComment: View {
    var body: some View {
        SearchBar(text: .constant(""), color: .constant("#F6F6F6"))
            .padding(.leading,-50)
            .padding(.trailing,-50)
        
        HStack{
            //머지하고 연결
            RadioButtonset(name: "게시글")
            RadioButtonset(name: "댓글")
            RadioButtonset(name: "좋아요 한 글")
            Spacer()
        }
        .padding(.leading,240)
        
        MyContentList()
            .padding(.top,-10)
    }
}

#Preview {
    MyComment()
}

