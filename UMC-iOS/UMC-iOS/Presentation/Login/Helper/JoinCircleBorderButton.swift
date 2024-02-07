//
//  JoinCircleBorderButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/11/24.
//

import SwiftUI

//동그라미 border 버튼 (ex: 기수선택, 파트선택)
struct borderCustomButton: View {
    @State private var isButtonPressed = false
    
    var title: String
    var fontSize: CGFloat = 18
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            // 버튼이 클릭되었을 때 수행할 동작
            isButtonPressed.toggle()
            action()
        }) {
            Text(title)
                .font(.system(size: fontSize))
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white, lineWidth: 1)
            
        )
        .foregroundColor(isButtonPressed ? .black : .white)
        .background(isButtonPressed ? Color.white : nil)
        .cornerRadius(16)
                
    }
}
