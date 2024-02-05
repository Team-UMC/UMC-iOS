//
//  JoinNavigationButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/9/24.
//

import SwiftUI

//회원가입시 다음 페이지 넘어가는 동그라미 버튼
struct JoinNavigationButton<Destination: View>: View {
    var destination: Destination
    @State private var isClicked = false

    var body: some View {
        Button(action: {
            isClicked.toggle()
        }) {
            HStack {
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                Spacer().frame(width: 16)
            }
            .padding(10)
            
        }
        //네비게이션 페이지 전환
        .navigationDestination(isPresented: $isClicked) {
            //다음 전환하고자 하는 페이지 / 백버튼 안보이게
            destination.navigationBarBackButtonHidden()
        }
    }
}
