//
//  HistorySearchView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/29.
//

import SwiftUI

struct HistorySearchView: View {
    @State var projectTitle: String = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                
                // 서치바
                HStack(spacing: 0) {
                    Image("historySearchBarImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .padding(.leading, 4)
                        .padding(.trailing, 8)
                    
                    TextField("프로젝트 제목을 입력해주세요",
                              text: $projectTitle,
                              prompt: Text("프로젝트 제목을 입력해주세요").foregroundColor(Color.tdlGray))
                        .font(.system(size: 14))
                        .kerning(-1.0)
                    
                    Spacer()
                } // HStack
                .padding(8)
                .background(Color.lightGray)
                .cornerRadius(12.0)
                
                // 취소 버튼
                Button {
                    print("HistorySearchCancelButton Tapped")
                } label: {
                    Text("취소")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                        .padding(10)
                } // Button
                
            } // HStack
            .padding(.horizontal, 16)
            
            ScrollView {
                HistoryProjectListView()
                    .padding(.top, 18)
                    .shadow(color: Color.gray.opacity(0.25), radius: 6, x: 0, y: 2)
            }
            
            Spacer()
            
        } // VStack
        .padding(.top, 12)
    }
}

#Preview {
    HistorySearchView()
}

