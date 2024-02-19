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
    @Binding var selectedNotice: BoardResponse.PinnedNotice
    var pinnedNotices: [BoardResponse.PinnedNotice] = []
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Rectangle() // 공지 배경
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .frame(width: 342, height: 28)
                .padding(.horizontal, 18)
               
            
                    
                    TabView(selection: $selectedIndex) {
                        ForEach(pinnedNotices.indices, id: \.self) { index in
                            HStack(spacing: 0) {
                                
                                var imageName: String {
                                    switch pinnedNotices[index].hostType {
                                    case "CENTER":
                                        return "AnnouncementUnit"
                                    case "BRANCH":
                                        return "AnnouncementGroup"
                                    case "CAMPUS":
                                        return "AnnouncementUniv"
                                    case "ALL":
                                        return "Announcement"
                                    default:
                                        return "Announcement"
                                    }
                                }
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 14, height: 14)
                                    .padding(.leading, 4)
                                    .padding(.trailing, 4)
                                    .padding(.top, 22)
                                    
                                
                                var labelText: String {
                                    switch pinnedNotices[index].hostType {
                                    case "CENTER":
                                        return "연합"
                                    case "BRANCH":
                                        return "지부"
                                    case "CAMPUS":
                                        return "학교"
                                    case "ALL":
                                        return "전체"
                                    default:
                                        return pinnedNotices[index].hostType
                                    }
                                }

                                Text("[\(labelText)]")
                                    .foregroundStyle(Color.main2)
                                    .font(.system(size: 14))
                                    .kerning(-1.07)
                                    .padding(.leading, 2)
                                    .padding(.top, 22)
                                    
                                  
                                
                                Text(pinnedNotices[index].title)
                                    .foregroundStyle(Color.black)
                                    .font(.system(size:14))
                                    .kerning(-1.07)
                                    .padding(.leading, 4)
                                    .padding(.top, 22)
                                    
                                    
                                
                                Spacer()
                            } // HStack
                        }
                    }
                    .frame(width: 300,height: 20)
                    
                    
        } // ZStack
        .onTapGesture {
            print("Announcementview Tapped")
            selectedNotice = pinnedNotices[selectedIndex]
            self.shouldShowAnnouncementPopup = true
        }
        .onReceive(timer) { _ in
            if !pinnedNotices.isEmpty {
                selectedIndex = (selectedIndex + 1) % pinnedNotices.count
                currentNotice = pinnedNotices[selectedIndex]
            }
//            print(currentNotice)
        }
    }
}
#Preview {
    HomeView()
}
