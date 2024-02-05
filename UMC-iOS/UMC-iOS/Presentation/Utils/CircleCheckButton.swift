//
//  JoinAgreCircleCheckButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/11/24.
//

import SwiftUI

//동그라미 체크박스 (ex: 약관동의)
struct CircleCheckButton: View {
    @State var circleCheckButton_isChecked: Bool = false
    var title: String
    var darkColor: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            circleCheckButton_isChecked.toggle()
            print(title)
            action()
        }, label: {
            if darkColor{
                Image(systemName: circleCheckButton_isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(circleCheckButton_isChecked ? .main : .gray)
                Text(title)
                    .foregroundStyle(.black)
                    .font(.system(size: 14))
            }
            else{
                Image(systemName: circleCheckButton_isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
            }
        })
    }
}
