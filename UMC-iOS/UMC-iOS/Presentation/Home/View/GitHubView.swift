//
//  GitHubView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct GitHubView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Git - Hub")
                    .font(.system(size: 16, weight: .semibold))
                    .kerning(-1.05)
                    .foregroundStyle(Color.main2)
                
                Spacer()
            }
            .padding(.bottom, 12)
            ZStack {
                Rectangle()
                    .frame(height: 128)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.gray.opacity(0.25), radius: 6, x: 0, y: 2)
                
                VStack(spacing: 0) {
                    VStack(spacing: 0) { // 글 VStack
                        HStack(spacing: 0) {
                            Text("깃허브")
                                .fontWeight(.semibold)
                            Text("를")
                        } // HStack
                        
                        Text("연결해 주세요👾")
                    } // VStack
                    .font(.system(size: 12))
                    .kerning(-1.05)
                    
                    Button {
                        print("GitButton Clicked")
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.black)
                    } // Button
                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 8, trailing: 0))
                } // VStack
            } // ZStack
        } // VStack
        .padding(.trailing, 18)
    }
}
