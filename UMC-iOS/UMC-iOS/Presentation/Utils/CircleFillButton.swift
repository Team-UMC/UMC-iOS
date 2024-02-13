//
//  CircleFillButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/22/24.
//

import SwiftUI

struct CircleFillButton: View {
    
    
    var title: String
    @State var isChecked: Bool = false
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(spacing: 4) {
                Text(title)
                    .foregroundColor(isChecked ? .main : Color.buttonDisabled)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .kerning(-0.5)
                
                if isChecked {
                    ZStack{
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.white)
                            .overlay(
                            RoundedRectangle(cornerRadius: 90)
                                .stroke(Color.main, lineWidth: 1)
                            )
                        
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(.main)
                    }
                } else{
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.white)
                        .overlay(
                        RoundedRectangle(cornerRadius: 90)
                            .stroke(Color.buttonDisabled, lineWidth: 1)
                        )
                        
                }
            }
        }
    }
}

