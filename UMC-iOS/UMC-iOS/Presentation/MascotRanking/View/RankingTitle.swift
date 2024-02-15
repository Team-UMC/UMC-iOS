//
//  RankingTitle.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/15.
//

import SwiftUI

struct RankingTitle: View {
    @ObservedObject var viewModel = MascotRankingViewModel()
    @State private var date = Date()

    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
    }

    var body: some View {
        // 타이틀
        Text("우리 학교 지금은?")
            .font(.system(size: 24, weight: .semibold))
            .foregroundStyle(.white)
        Text("\(formattedDate) 기준")
            .font(.system(size: 12))
            .foregroundStyle(.grayDivider)
    }
}

#Preview {
    RankingTitle()
}
