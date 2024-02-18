//
//  TodayILearnedHomeCell.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/19/24.
//

import SwiftUI

struct TodayILearnedHomeCell: View {
    var todayILearnedInfo: TodayILearnedResponse.TodayILearnedInfo
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle().frame(width: 1, height: 24)
                .padding(.trailing, 8)
            Image(systemName: "person.fill")
                .padding(.trailing, 8)
            VStack(spacing: 0) {
                Text(todayILearnedInfo.title)
                    .font(.system(size: 16, weight: .semibold))
                Text(todayILearnedInfo.subTitle)
                    .font(.system(size: 10, weight: .semibold))
            }
            Spacer()
        }
        .frame(width: 128, height: 30)
    }
}

#Preview {
    TodayILearnedHomeCell(todayILearnedInfo: TodayILearnedResponse.TodayILearnedInfo())
}
