//
//  JoinTextFieldStyle.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/10/24.
//

import SwiftUI

struct JoinTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(.white)
            .multilineTextAlignment(.center)
            .frame(width: 272, height: 40)
            .cornerRadius(12)
            .foregroundStyle(.black)
//            .overlay(
//                RoundedRectangle(cornerRadius: 12)
//                    .stroke(Color.white, lineWidth: 1)
//            )
    }
}
