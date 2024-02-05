//
//  WritingListCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct WritingListCell: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                WitingButton(title: "공지사항")
                WitingButton(title: "자유게시판")
                WitingButton(title: "질문게시판")
                WitingButton(title: "이전 기수 게시판")
            }
            .padding(.bottom,8)
            WitingButton(title: "워크북 게시판")
        }
        
    }
}

#Preview {
    WritingListCell()
}

