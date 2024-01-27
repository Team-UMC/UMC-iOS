//
//  announcementView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct AnnouncementView: View {
    @Binding var shouldShowAnnouncementPopup: Bool
    
    var body: some View {
        ZStack {
            Rectangle() // 공지 배경
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .frame(height: 28)
                .padding(.horizontal, 18)
            
            HStack(spacing: 0) {
                Image("earthImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .padding(.leading, 26)
                
                Text("[연합]")
                    .foregroundStyle(Color.main2)
                    .font(.system(size: 16))
                    .kerning(-1.07)
                    .padding(.leading, 4)
                
                Text("12월 20일 회식 개최!")
                    .foregroundStyle(Color.black)
                    .font(.system(size:16))
                    .kerning(-1.07)
                    .padding(.leading, 2)
                
                Spacer()
            } // HStack
        } // ZStack
        .onTapGesture {
            print("Announcementview Tapped")
            self.shouldShowAnnouncementPopup = true
        }
    }
}
