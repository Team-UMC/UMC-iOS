//
//  HistorySearchBarView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/29.
//

import SwiftUI

struct HistorySearchBarView: View {
    @State var projectTitle: String = ""
    
    var body: some View {
        // 서치바
        HStack(spacing: 0) {
            Image("historySearchBarImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .padding(.leading, 4)
                .padding(.trailing, 8)
            
            TextField("프로젝트명, 관련 해시태그",
                      text: $projectTitle,
                      prompt: Text("프로젝트명, 관련 해시태그").foregroundColor(Color.tdlGray))
                .font(.system(size: 14))
                .kerning(-1.0)
            
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
