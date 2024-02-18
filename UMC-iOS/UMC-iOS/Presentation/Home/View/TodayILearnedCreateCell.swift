//
//  TodayILearnedCreateCell.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/19/24.
//

import SwiftUI

struct TodayILearnedCreateCell: View {
    var body: some View {
        HStack(spacing: 0) {
            Rectangle().frame(width: 1, height: 24)
                .padding(.trailing, 8)
            Image(systemName: "plus.circle.fill")
                .padding(.trailing, 8)
            VStack(spacing: 0) {
                Text("TIL 추가하기")
                    .font(.system(size: 16, weight: .semibold))
            }
            Spacer()
        }
        .frame(width: 128, height: 30)
    }
}

#Preview {
    TodayILearnedCreateCell()
}
