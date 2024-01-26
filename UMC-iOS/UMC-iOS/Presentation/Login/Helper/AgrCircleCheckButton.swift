//
//  AgrCircleCheckButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/23/24.
//

import SwiftUI

//동그라미 체크박스 (ex: 약관동의)
struct AgrCircleCheckButton: View {
    @Binding var AgrCircleCheckButton_isChecked: Bool
    var title: String
    var darkColor: Bool = false
    var action: () -> Void
    var body: some View {
        Button(action: {
            AgrCircleCheckButton_isChecked.toggle()
            print(title)
            action()
        }, label: {
            Image(systemName: AgrCircleCheckButton_isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
            Text(title)
                .foregroundStyle(.white)
                .font(.system(size: 16))
        })
    }
}
