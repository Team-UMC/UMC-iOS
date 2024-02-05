//
//  MascotView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct MascotView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Mascot")
                    .font(.system(size: 16, weight: .semibold))
                    .kerning(-1.07)
                    .foregroundStyle(Color.main2)
                
                Spacer()
            }
            .padding(.bottom, 12)
            ZStack {
                Image("mascotRankBackgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .cornerRadius(12.0)
                
                VStack(spacing: 0) {
                    Image("mascotImage2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 154, height: 154)
                        .padding(.bottom, 5)
                } // VStack
            } // ZStack
        } // VStack
        .padding(.leading, 18)
    }
}

#Preview {
    MascotView()
}
