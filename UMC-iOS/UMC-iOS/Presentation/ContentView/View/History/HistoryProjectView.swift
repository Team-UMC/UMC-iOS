//
//  HistoryProjectView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/28.
//

import SwiftUI

struct HistoryProjectView: View {
    var body: some View {
        VStack(spacing: 0) { // 역대 프로젝트 낱개
            HStack(spacing: 0) { // 프로젝트 분류 키워드, 기수
                HStack(spacing: 4) { // 프로젝트 분류 키워드
                    Text("4기")
                        .font(.system(size: 8))
                        .fontWeight(.regular)
                        .kerning(-0.32)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.background)
                        .cornerRadius(12.0)
                    
                    Text("iOS")
                        .font(.system(size: 8))
                        .fontWeight(.regular)
                        .kerning(-0.32)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.background)
                        .cornerRadius(12.0)
                } // VStack
                
                Spacer()
                
                Image("umc4th") // UMC 기수 색
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
            } // HStack
            
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) { // 프로젝트 타이틀, 설명, 해시태그
                    Text("오월이") // 프로젝트 타이틀
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .kerning(-1.12)
                        .foregroundColor(Color.black)
                    
                    Text("오월이는\n가족 커뮤니티로,\n소중한 추억을\n기록할 수 있어요!") // 프로젝트 설명
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .kerning(-0.84)
                        .foregroundColor(Color.tdlGray)
                        .padding(.top, 2)
                    
                    HStack(spacing: 4) { // 프로젝트 해시태그
                        ForEach(0..<3) { index in
                            Text("#가족")
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                                .kerning(-0.7)
                                .foregroundColor(Color.historyProjectHashTag)
                        }
                    } // HStack
                    .padding(.top, 12)
                } // VStack
                
                Spacer()
                
            } // HStack
            .padding(.top, 4)
            
            HStack(spacing: 0) {
                Spacer()
                Image("hotProjectIconEx")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 110)
            } // HStack
            .padding(.trailing, -14)
            
        } // VStack
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.white)
        .cornerRadius(12.0)
    }
}

#Preview {
    HistoryProjectView()
}
