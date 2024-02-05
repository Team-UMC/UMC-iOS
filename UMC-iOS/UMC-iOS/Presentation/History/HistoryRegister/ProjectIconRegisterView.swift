//
//  ProjectIconRegisterView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/30.
//

import SwiftUI

struct ProjectIconRegisterView: View {
    var body: some View {
        HStack(spacing: 0) {
            
            // 아이콘 등록 문구
            Text("앱 아이콘을 등록해주세요")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .kerning(-1)
                .foregroundColor(Color.buttonDisabled)
                .padding(.horizontal, 8)
                .padding(.vertical, 5.5)
            
            Spacer()
            
            // 플러스 버튼
            Button {
                print("iconAddBtn Tapped")
            } label: {
                Image("iconAddButtonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .padding(8)
            } // 플러스 버튼
        } // HStack
        .padding(.horizontal, 16.5)
        .padding(.vertical, 9)
    }
}

#Preview {
    ProjectIconRegisterView()
}
