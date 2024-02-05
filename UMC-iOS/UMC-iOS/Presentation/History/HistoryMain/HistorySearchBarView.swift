//
//  HistorySearchBarView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/29.
//

import SwiftUI

struct HistorySearchBarView: View {
    
    var body: some View {
        // 서치바
        HStack(spacing: 0) {
            Image("historySearchBarImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .padding(.leading, 4)
                .padding(.trailing, 8)
            
            Text("프로젝트명, 관련 해시태그")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .kerning(-1.0)
                .foregroundColor(Color.tdlGray)
            
            Spacer()
        } // HStack
        .padding(8)
        .background(Color.white)
        .cornerRadius(12.0)
        .padding(.horizontal, 16)
    }
}

#Preview {
    HistorySearchBarView()
}
