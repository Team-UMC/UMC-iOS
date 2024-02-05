//
//  BulletinBoardUI.swift
//  BulletinBoardUI
//
//  Created by 나예은 on 2024/01/25.
//

import SwiftUI

struct BulletinBoardUI: View {
    var background = "background_BB"
    
    var body: some View {
        NavigationView {
            ZStack {
                // 배경
                Image(background)
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack(alignment: .leading) {
                    // 학교 ~ 건의함
                    NavigationLink(destination: Text("학교")) {
                        BulletinBoardFirstBtn()
                            .padding(.top, 60)
                            .padding(.leading, 16)
                    }
                    
                    // 공지사항 ~ 워크북 게시판
                    BulletinBoardSecondBtn()
                        .padding(.top, -150)
                        .padding(.bottom, 16)
                        .padding(.leading, 16)
                    
                    // 게시글 리스트
                    BulletinBoardList()
                        .padding(.top, -350)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    
                    Spacer()
                }
                
                Image("TILButton")
                    .resizable()
                    .frame(width: 46, height: 46)
                    .padding(.top, 600)
                    .padding(.leading, 300)
            }
            .navigationBarHidden(true)
        }
    }
}

struct BulletinBoardUI_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoardUI()
    }
}


