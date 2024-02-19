//
//  MyContributionButtonView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct MyContributionButtonView: View {
    
    @Binding var activeRankingOrContribution: Int
    @Binding var goToRankingView: Bool
    
    var body: some View {
        
        // 학교 랭킹 버튼
        Button {
            print("기여도버튼 Tapped")
            goToRankingView.toggle()
            activeRankingOrContribution = 2
        } label: {
            
            VStack(spacing: 4) {
                
                Image("myContributionButtonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
                Text("나의 기여도")
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .kerning(-1)
                    .foregroundColor(Color.tdlGray)
                
            } // VStack
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(12)
            
        } // Button
    }
}
