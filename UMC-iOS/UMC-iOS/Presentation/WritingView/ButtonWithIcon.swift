//
//  ButtonWithIcon.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//
//이것도 머지하고 연결함
import SwiftUI

struct ButtonWithIcon: View {
    @State var title: String
    @State var icon : String
    @State private var isCompleted = false
    var body: some View {
        ZStack{
            Rectangle()
                .fill(isCompleted ?Color("searchPurple"):Color(.white))
                .cornerRadius(32)
                .frame(width:72,height: 32)
                .overlay(
            HStack{
                ZStack{
                    Circle()
                        .fill(.white)
                        .frame(width: 24, height: 24)
                        .padding(.leading, 4)
                        .padding(.trailing, -2)
                        .overlay(
                    Image(icon)
                        .resizable()
                        .frame(width:12,height: 12)
                        .padding(.leading, 2)
                        .padding(.trailing, -2)
                    )
                }
                
                Text(title)
                    .font(.system(size: 14))
                    .bold()
                    .foregroundColor(isCompleted ?Color(.white):Color(.gray))
                    
                Spacer()
            })
            .padding(4)
        }
    }
}

// 수정: Preview 블록 수정
struct ButtonWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithIcon(title: "학교", icon: "school")
            .previewLayout(.sizeThatFits)
    }
}


