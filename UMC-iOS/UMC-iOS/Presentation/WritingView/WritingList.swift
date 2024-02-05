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
        List{
            //list1
            VStack{
                HStack{
                    Text("게시판 선택")
                        .bold()
                        .font(.system(size:18))
                Spacer()
                }
                WritingListCellFirst()
            }
            //list2
            WritingListCell()
            //list3
            HStack{
                Text("첨부파일")
                    .foregroundColor(Color("#999999"))
                    .bold()
                    .font(.system(size:18))
                    .padding(.top,14)
                    .padding(.bottom,14)
                
                Spacer()
                Button(action: {
                }) {
                    Image("PlusButton")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            // list4
            TextField("제목", text: $title)
                .foregroundColor(Color("#999999"))
                .bold()
                .font(.system(size: 18))
                .padding(.top,14)
                .padding(.bottom,14)

            
            // list5
            TextField("내용을 입력해주세요", text: $content)
                .foregroundColor(Color("#999999"))
                .bold()
                .font(.system(size: 14))
                
                
            
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    WritingList(title: "제목", content: "")
}

