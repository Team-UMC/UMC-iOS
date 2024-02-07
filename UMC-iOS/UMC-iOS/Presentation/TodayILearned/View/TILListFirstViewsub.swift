//
//  TILListFirstViewsub.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

struct TILListFirstViewsub: View {
    private var projectTypeButtonIcon:  [String] = ["web","AOS","iOS","Study"]
    
    private var projectType: [String] = ["Web", "Android","iOS","study"]
    
    @State private var isProjectTypeButtonTapped : [Bool] = [false, false, false, false]
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 9) {
                ForEach(0..<5) { index in
                    Button {
                        print("\(projectTypeButtonIcon[index]) Tapped")
                        self.isProjectTypeButtonTapped[index].toggle()
                        
                    } label: {
                        
                        HStack(spacing: 6) { // 버튼 하나 전체
                            
                            ZStack { // 원 배경 + 아이콘
                                Circle()
                                    .foregroundColor(
                                        self.isProjectTypeButtonTapped[index] ?
                                        Color.white : Color.disabledButtonIconBackground)
                                        
                                    .frame(width: 24, height: 24)
                                
                                Image(projectTypeButtonIcon[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 16, height: 16)
                            } // ZStack (원 + 아이콘)
                            
                            Text("\(projectType[index])")
                                .font(.system(size: 14))
                                .fontWeight(
                                    self.isProjectTypeButtonTapped[index] ?
                                        .semibold : .regular)
                                .kerning(-0.98)
                                .foregroundColor(
                                    self.isProjectTypeButtonTapped[index] ?
                                    Color.white : Color.buttonTextBorder)
                            
                        } // VStack (아이콘 + 글자)
                        .padding(4)
                        .padding(.trailing, 10)
                        .background(
                            self.isProjectTypeButtonTapped[index] ?
                            Color.historyPurple : Color.white)
                        .cornerRadius(32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 32)
                                .stroke(
                                    self.isProjectTypeButtonTapped[index] ?
                                        Color.historyPurple : Color.historyDisabledGray,
                                    lineWidth: 1)
                        )
                    }
                }
                
                Spacer()
                
            } // HStack
            .padding(.vertical, 8)
            
                
        } // VStack
        .padding(.horizontal, 16.5)
    }
}

#Preview {
    TILListFirstViewsub()
}

