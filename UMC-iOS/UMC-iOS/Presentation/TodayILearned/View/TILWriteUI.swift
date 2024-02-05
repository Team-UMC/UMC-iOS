//
//  TILWriteUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct TILWriteUI: View {
    @State var title: String
    @State var subtitle: String
    @State var content: String
    var body: some View {
        List{
            //list1
            VStack{
                HStack{
                    Text("분류")
                        .bold()
                        .font(.system(size:18))
                        .padding(.leading,10)
                    Spacer()
                }
                WritingListCellFirst()
            }
            
            //list2
            HStack{
                Text("첨부파일")
                    .foregroundColor(Color("#999999"))
                    .bold()
                    .font(.system(size:18))
                Spacer()
                Button(action: {
                
                }) {
                    Image("PlusButton")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            
            HStack{
                Text("노션연동")
                    .foregroundColor(Color("#999999"))
                    .bold()
                    .font(.system(size:18))
                Spacer()
                Button(action: {
                }) {
                    Image("PlusButton")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            
            // list3
            TextField("제목", text: $title)
                .foregroundColor(Color("#999999"))
                .bold()
                .font(.system(size: 18))
            
            // list3
            TextField("소제목", text: $subtitle)
                .foregroundColor(Color("#999999"))
                .bold()
                .font(.system(size: 18))
            
            
            // list4
            TextField("내용을 입력해주세요", text: $content)
                .foregroundColor(Color("#999999"))
                .bold()
                .font(.system(size: 14))
            
            
            
        }
        .listStyle(PlainListStyle())
        .padding(.leading,20)
        .padding(.trailing,20)
    }
}

#Preview {
    TILWriteUI(title: "", subtitle: "", content: " ")
}

