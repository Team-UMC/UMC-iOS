//
//  HomeNavigationBar.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct HomeNavigationBarView: View {
    // 버튼 이름 리스트
    let imageNames: [String] = ["menuButtonImage",
                                "reportButtonImage",
                                "friendsButtonImage",
                                "noticeButtonImage",
                                "hammerButtonImage"]
    var body: some View {
        HStack {
            Button { // 왼쪽 메뉴 버튼
                print("\(imageNames[0]) Clicked")
            } label: {
                Image(imageNames[0])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            } // Button
            .padding(.leading, 20)
            
            Spacer()
            
            HStack { // 오른쪽 버튼 4개
                ForEach(1..<imageNames.count, id: \.self) { index in
                    Button {
                        print("\(imageNames[index]) Clicked")
                    } label: {
                        Image(imageNames[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.leading, 16)
                    } // Button
                }
            } // HStack
            .padding(.trailing, 20)
        } // HStack
    }
}
