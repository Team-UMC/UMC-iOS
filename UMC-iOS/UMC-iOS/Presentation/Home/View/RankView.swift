//
//  RankView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct RankView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Rank")
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
                    Image("userProfileEx")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .shadow(color: Color.gray.opacity(0.65), radius: 6, x: 0, y: 2)
                        .padding(.bottom, 5)
                    
                    VStack(spacing: 0) { // 글 Stack
                        HStack(spacing: 0) {
                            Text("원")
                                .fontWeight(.semibold)
                            Text("님은")
                        } // HStack
                        
                        HStack(spacing: 0) {
                            Text("현재")
                            Text("4등")
                                .fontWeight(.semibold)
                                .padding(.leading, 2)
                            Text("이에요!🫢")
                        } // HStack
                    } // VStack
                    .foregroundStyle(Color.white)
                    .font(.system(size: 12))
                    .kerning(-1.03)
                } // VStack
            } // ZStack
        } // VStack
        .padding(.trailing, 18)
    }
}
