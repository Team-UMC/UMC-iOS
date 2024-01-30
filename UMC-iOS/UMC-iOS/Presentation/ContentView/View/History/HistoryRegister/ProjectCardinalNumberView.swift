//
//  ProjectCardinalNumberView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/30.
//

import SwiftUI

struct ProjectCardinalNumberView: View {
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<6) { index in
                Button {
                    print("\(index + 1)기 Btn Tapped")
                } label: {
                    Text("\(index + 1)기")
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .kerning(-0.84)
                        //.frame(height: 14)
                        .foregroundColor(Color.historyDisabledGray)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 89)
                                .stroke(Color.historyDisabledGray, lineWidth: 1)
                        )
                }
                .onTapGesture {
                }
            }
            
            Spacer()
            
        } // HStack
        .padding(.horizontal, 16.5)
        .padding(.vertical, 10)
    }
}

#Preview {
    ProjectCardinalNumberView()
}
