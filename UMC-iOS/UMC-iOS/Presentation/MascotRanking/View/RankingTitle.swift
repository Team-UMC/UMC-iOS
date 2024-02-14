//
//  RankingTitle.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/15.
//

import SwiftUI

struct RankingTitle: View {
    @ObservedObject var viewModel = MascotRankingViewModel()
    var Date: String = "2023.12.01"
    var body: some View {
        //타이틀
        Text("우리 학교 지금은?")
            .font(.system(size: 24, weight: .semibold))
            .foregroundStyle(.white)
        Text("\(Date) 기준")
            .font(.system(size: 12))
            .foregroundStyle(.grayDivider)
        
    }
}

#Preview {
    RankingTitle()
}
