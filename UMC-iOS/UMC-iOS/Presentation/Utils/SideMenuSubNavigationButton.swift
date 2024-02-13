//
//  SideMenuSubNavigationButton.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/13.
//

import SwiftUI

struct SideMenuSubNavigationButton<Destination: View>: View {
    var destination: Destination
    var MenuName: String
    @State private var isClicked = false

    var body: some View {
        Button(action: {
            isClicked.toggle()
        }) {
            VStack {
                Text(MenuName)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
            
        }
        //네비게이션 페이지 전환
        .navigationDestination(isPresented: $isClicked) {
            //다음 전환하고자 하는 페이지 / 백버튼 안보이게
            destination
                
        }
 
    }
}

