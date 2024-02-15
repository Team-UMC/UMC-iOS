//
//  UniversityRankButtonView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct UniversityRankButtonView: View {
    
    @Binding var isTapped1: Bool
    
    var body: some View {
        
        // 학교 랭킹 버튼
        Button {
            print("랭킹버튼 Tapped")
            self.isTapped1.toggle()
        } label: {
            
            VStack(spacing: 4) {
                
                Image("universityRankButtonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
                Text("학교 랭킹")
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .kerning(-1)
                    .foregroundColor(Color.tdlGray)
                
            } // VStack
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(12)
            
        } // Button
        .navigationDestination(isPresented: $isTapped1) {
            RankingDetailView()
        }
    }
}
