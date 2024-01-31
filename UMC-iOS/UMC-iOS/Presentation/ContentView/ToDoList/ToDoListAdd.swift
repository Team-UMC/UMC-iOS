//
//  ToDoListAdd.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/30.
//

import SwiftUI

struct ToDoListAdd: View {
    @State var ToDoTitle: String
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("#F0F4FF"))
                .frame(width:340, height: 46)
                .cornerRadius(12)
            
            HStack{
                ZStack{
                    Rectangle()
                        .fill(.white)
                        .frame(width:30, height: 30)
                        .cornerRadius(6)
                        .padding(.leading,24)
                    
                    Text("🌕")
                        .padding(.leading,24)
                }
                
                TextField("할일을 입력해주세요.",text: $ToDoTitle)
                    .foregroundColor(Color("textColor"))
                    .font(.system(size: 12))
                    .padding(.leading,10)
                    .frame(width:220)
                
                Button(action: {
                    print("더보기를 눌렀습니다")
                }) {
                    Text("추가")
                        .font(.system(size: 12))
                        .bold()
                        .frame(width: 48,height: 30)
                        .foregroundColor(Color("searchPurple"))
                        .background(.white)
                        .cornerRadius(12)

                }
                
                Spacer()
            }
            .padding()
            

                
        }

        
    }
}

#Preview {
    ToDoListAdd(ToDoTitle: "할일을 입력해주세요.")
}

