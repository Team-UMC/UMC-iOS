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
        VStack(spacing: 8) {
            HStack(spacing: 8) { // 역대 프로젝트, 기수, 유형 버튼
                Text("역대 프로젝트")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .kerning(-1.68)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Text("기수")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .kerning(-1.5)
                        .foregroundColor(.middleGray)
                    Button {
                        print("기수Btn Tapped")
                    } label: {
                        Image("downButtonImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                    }
                } // HStack
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.white)
                .cornerRadius(38.0)
                
                HStack(spacing: 4) {
                    Text("유형")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .kerning(-1.5)
                        .foregroundColor(.middleGray)
                    Button {
                        print("기수Btn Tapped")
                    } label: {
                        Image("downButtonImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                    }
                } // HStack
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.white)
                .cornerRadius(38.0)
            } // HStack
            
            // 서치바
            HStack(spacing: 0) {
                Image("historySearchBarImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .padding(.leading, 4)
                    .padding(.trailing, 8)
                
                TextField("프로젝트명, 관련 해시태그", text: $projectTitle)
                    .font(.system(size: 14))
                    .kerning(-1.0)
                
                Spacer()
            } // HStack
            .padding(8)
            .background(Color.white)
            .cornerRadius(12.0)
            
        } // VStack
        .padding(.horizontal, 20)
    }
}

#Preview {
    HistorySearchBarView()
}
