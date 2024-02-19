//
//  announcementView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct AnnouncementView: View {
    @State private var selectedIndex = 0
    @Binding var shouldShowAnnouncementPopup: Bool
    @Binding var currentNotice: BoardResponse.PinnedNotice
    var pinnedNotices: [BoardResponse.PinnedNotice] = []
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Rectangle() // 공지 배경
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .frame(height: 28)
                .padding(.horizontal, 18)
            
            TabView(selection: $selectedIndex) {
                ForEach(pinnedNotices.indices, id: \.self) { index in
                    HStack(spacing: 0) {
                        Image(pinnedNotices[index].hostType)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                            .padding(.leading, 26)
                        
                        Text(pinnedNotices[index].hostType)
                            .foregroundStyle(Color.main2)
                            .font(.system(size: 16))
                            .kerning(-1.07)
                            .padding(.leading, 4)
                        
                        Text(pinnedNotices[index].title)
                            .foregroundStyle(Color.black)
                            .font(.system(size:16))
                            .kerning(-1.07)
                            .padding(.leading, 2)
                        
                        Spacer()
                    } // HStack
                }
            }
            
            
        } // ZStack
        .onTapGesture {
            print("Announcementview Tapped")
            self.shouldShowAnnouncementPopup = true
        }
        .onReceive(timer) { _ in
            selectedIndex = (selectedIndex + 1) % pinnedNotices.count
            currentNotice = pinnedNotices[selectedIndex]
            print(currentNotice)
        }
    }
}
