//
//  WritingList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct WritingList: View {
    @State var title: String
    @State var content: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            MyWritingNavigationView()
            
            ButtonWithIcon()
            
            Divider().background(Color.gray)
                .padding(.horizontal, 14)
                .padding(.bottom, 8)
            
            HStack {
                WitingButton(title: "공지사항")
                WitingButton(title: "자유게시판")
                WitingButton(title: "질문게시판")
                WitingButton(title: "이전 기수 게시판")
            }
            .padding(.leading, 14)
            .padding(.bottom, 8)
            WitingButton(title: "워크북 게시판")
                .padding(.leading, 14)
            
            Divider().background(Color.gray)
                .padding(.horizontal, 14)
                .padding(.bottom, 8)
            
            WritingListCellFirst()
            
            Divider().background(Color.gray)
                .padding(.horizontal, 14)
                .padding(.bottom, 8)
            
            WritingListCellSecond()
            
            Divider().background(Color.gray)
                .padding(.horizontal, 14)
                .padding(.bottom, 8)
            
            WritingListThirdCell()
            
            Spacer()
        }
    }
}

#Preview {
    WritingList(title: "제목", content: "")
}
