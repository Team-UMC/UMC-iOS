//
//  RankingViewTitle.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/14.
//

import SwiftUI

struct RankingViewTitle: View {
    var Date: String = "2023.12.01"
    var body: some View {
        VStack{
            Spacer().frame(height: 120)
            VStack{
                Text("우리 학교 지금은?")
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.bottom,2)
                
                Text("\(Date) 기준")
                    .font(.system(size: 12))
                    .foregroundStyle(.grayDivider)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    RankingViewTitle()
}
