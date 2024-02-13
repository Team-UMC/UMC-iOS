//
//  TILUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct TILUI: View {
    @State private var isClicked = false
    
    var body: some View {
        VStack {
            
            TILNavigationbar()
                .padding(.bottom, 10)
            
            TodoDate()
                .padding(.bottom, 0)
                .padding(.leading, 15)
            
            ZStack {
                TILList()
                Button(action: {
                    isClicked = true
                }) {
                    Image("TILButton")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .padding(.top, 600)
                        .padding(.leading, 300)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $isClicked) {
            TILWriteUI(title: "", subtitle: "", content: "")
        }
    }
}


// 미리보기
struct TILUI_Previews: PreviewProvider {
    static var previews: some View {
        TILUI()
    }
}


