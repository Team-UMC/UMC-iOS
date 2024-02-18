//
//  HomeNavigationBar.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct HomeNavigationBarView: View {
    @Binding var presentSideMenu: Bool // 상태 바인딩
    // 버튼 이름 리스트
    let imageNames: [String] = ["menuButtonImage",
                                "reportButtonImage",
                                "friendsButtonImage",
                                "noticeButtonImage",
                                "hammerButtonImage"]
    
    @Binding var isNavigationBtnTapped: [Bool]
    private let buttonViews: [AnyView] = [
    
        AnyView(ManagerSetting()), // 추후 수정 예정
        AnyView(ManagerSetting()), // 추후 수정 예정
        AnyView(ManagerSetting()), // 추후 수정 예정
        AnyView(ManagerSetting())
    
    ]
    
    var body: some View {
        HStack {
            Button { // 왼쪽 메뉴 버튼
                print("\(imageNames[0]) Clicked")
                presentSideMenu.toggle()
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
                        print(index - 1)
                        self.isNavigationBtnTapped[index-1].toggle()
                        print(isNavigationBtnTapped)
                    } label: {
                        Image(imageNames[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.leading, 16)
                    } // Button
                    .navigationDestination(isPresented: $isNavigationBtnTapped[index - 1]){
                        buttonViews[index - 1]
                    }
                    
                }
            } // HStack
            .padding(.trailing, 20)
        } // HStack
    }
}

//#Preview {
//    HomeView()
//}
