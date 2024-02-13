//
//  BottomTabBar.swift
//  vedio
//
//  Created by 나예은 on 2024/02/08.
//

import SwiftUI

struct BottomTabBar: View {
    
let Navy = Color("NavyText")
    
    var body: some View {

        
        TabView {
            
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house.fill")
                }
            
            BulletinBoardUI()
                .tabItem {
                    Label("게시판", systemImage: "list.bullet.clipboard.fill")
                }
            
            HistoryView()
                .tabItem {
                    Label("히스토리", systemImage: "clock.arrow.circlepath")
                }
            
            Text("사진첩 추후 구현 예정")
                .tabItem {
                    Label("사진첩", systemImage: "photo.fill")
                }
            
            Text("채팅 추후 구현 예정")
                .tabItem {
                    Label("채팅", systemImage: "bubble.left.fill")
                }
        }
        .accentColor(Navy)
        
        
    }
}

#Preview {
    BottomTabBar()
}


