//
//  JoinAgreCircleCheckButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/11/24.
//

import SwiftUI

//동그라미 체크박스 (ex: 약관동의)
struct JoinAgreCircleCheckButton: View {
    @Binding var circleCheckButton_isChecked: Bool
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            circleCheckButton_isChecked.toggle()
            action()
        }, label: {
            Image(systemName: circleCheckButton_isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                
            Text(title)
                .foregroundStyle(.white)
                .font(.system(size: 16))
        })
    }
}
