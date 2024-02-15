//
//  TILUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI
struct TILUI: View {
    var body: some View {
        NavigationView {
            
            VStack {
                
                TILNavigationbar()
                    .padding(.bottom, 10)
                
                TodoDate()
                    .padding(.bottom, -25)
                    .padding(.leading, 15)
                
                ZStack {
                    TILList()
                    NavigationLink(destination: TILWriteUI(title: "", subtitle: "", content: "")) {
                        Image("TILButton")
                            .resizable()
                            .frame(width: 46, height: 46)
                            .padding(.top, 600)
                            .padding(.leading, 300)
                            .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

// 미리보기
struct TILUI_Previews: PreviewProvider {
    static var previews: some View {
        TILUI()
    }
}



