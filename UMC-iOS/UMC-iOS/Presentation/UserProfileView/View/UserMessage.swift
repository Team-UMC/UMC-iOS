//  UserMessage.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI

struct UserMessage: View {
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    
    var body: some View {
        // 상태 메세지
        ZStack {
        Rectangle()
                .fill(Color.white)
                .cornerRadius(12)
                .shadow(color:.gray.opacity(0.3), radius: 5)
                .frame(width: 280, height: 75)
            VStack(spacing: 8) {
                Text("상태 메세지")
                    .font(.system(size: 14).bold())
                Text("상태메세지를 입력해주세요.")
                .font(.system(size: 16))
            }
        }
        
         Button(action: {
             print("수정하기 버튼")
         }) {
         Text("수정하기")
             .font(.system(size: 16, weight: .black))
             .padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16))
             .foregroundColor(.white)
             .background(Color.black)
             .cornerRadius(17.5)
             .shadow(radius: 10)
         }
         
        
    }
}

#Preview {
    UserMessage()
}

