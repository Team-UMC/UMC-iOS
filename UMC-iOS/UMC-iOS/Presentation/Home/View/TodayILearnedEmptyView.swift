//
//  TodayILearnedEmptyView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct TodayILearnedEmptyView: View {
    @Binding var goToTodayILearned: Bool
    let memberNickname: String
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Today I - Leanred")
                    .font(.system(size: 16, weight: .semibold))
                    .kerning(-1.05)
                    .foregroundStyle(Color.main2)
                
                Spacer()
            }
            .padding(.bottom, 12)
            ZStack {
                Rectangle()
                    .frame(height: 128)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.gray.opacity(0.25), radius: 6, x: 0, y: 2)
                
                VStack(spacing: 0) {
                    VStack(spacing: 0) { // 글 VStack
                        HStack(spacing: 0) {
                            Text(memberNickname)
                                .fontWeight(.semibold)
                            Text("님의")
                        } // HStack
                        
                        Text("열공을 응원해요🔥")
                    } // VStack
                    .font(.system(size: 12))
                    .kerning(-1.05)
                    
                    Button {
                        print("TILButton Clicked")
                        goToTodayILearned.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.black)
                    } // Button
                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 8, trailing: 0))
                } // VStack
            } // ZStack
        } // VStack
        .padding(.leading, 18)
    }
}
