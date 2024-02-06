//
//  BulletinBoardSecondBtn.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct BulletinBoardSecondBtn: View {
    @State private var selectedButton: Int?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                ButtonView_2(text: "공지사항", index: 1, selectedButton: $selectedButton)
                ButtonView_2(text: "자유게시판", index: 2, selectedButton: $selectedButton)
                ButtonView_2(text: "질문게시판", index: 3, selectedButton: $selectedButton)
            }
            HStack {
                ButtonView_2(text: "이전기수 게시판", index: 4, selectedButton: $selectedButton)
                ButtonView_2(text: "위크북 게시판", index: 5, selectedButton: $selectedButton)
            }
        }
    }
}

struct ButtonView_2: View {
    let text: String
    let index: Int
    @Binding var selectedButton: Int?
    
    var body: some View {
        Button(action: {
            selectedButton = index
        }) {
            Text(text)
                .padding(EdgeInsets(top: 6, leading: 14, bottom: 6, trailing: 14))
                .applyButtonStyle_2(selected: selectedButton == index)
            
        }
    }
}

extension View {
    func applyButtonStyle_2(selected: Bool) -> some View {
        self
            .font(.system(size: 14))
            .bold()
            .foregroundColor(selected ? Color(red: 135/255, green: 132/255, blue: 255/255) : Color.gray.opacity(0.8))
            .background(selected ? Color(red: 0xC7/255, green: 0xD5/255, blue: 0xFF/255) : Color.white)
            .cornerRadius(21)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0))
            .frame(width: .infinity, height: 30)
    }
}

struct BulletinBoardSecondBtn_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoardSecondBtn()
    }
}
