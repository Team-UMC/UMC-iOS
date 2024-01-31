//
//  HomeView.swift
//  UMCProject_Won
//
//  Created by 김승원 on 2024/01/10.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ZStack {
                    Image("homeBackgroundImage") // 원형 배경
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                        // .offset(x: 0)
                        .position(x: UIScreen.main.bounds.width/2, y: 119)
                    
                    VStack(spacing: 0) {
                        HomeNavigationBarView().padding(.top, 16)
                        
                        UserInformationView().padding(.top, 8)
                        
                        AnnouncementView(shouldShowAnnouncementPopup: $vm.shouldShowAnnouncementPopup).padding(.top, 8)
                        
                        MainCalendarView(currentDate: $vm.currentDate, shouldShowCalendarPopup: $vm.shouldShowCalendarPopup).padding(.top, 8)
                        ToDoListView().padding(.top, 24)
                        
                        HStack(spacing: 18) {
                            TodayILearnedView()
                            GitHubView()
                        }
                        .padding(.top, 24)
                        
                        HStack(spacing: 18) {
                            MascotView()
                            RankView()
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 24)
                        
                        Spacer()
                    } // VStack
                    
                } // ZStack
                
            } // ScrollView
            .background(Color.background)
            
            Rectangle() // 팝업 뷰 뒤에 회색 배경
                .foregroundColor(.black)
                .opacity(vm.shouldShowCalendarPopup||vm.shouldShowAnnouncementPopup ? 0.6 : 0) // 공지사항, 캘린더 둘 다 적용
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        } // ZStack (최 상단에 팝업 뷰 배치)
        // 공지사항 팝업
        .popup(isPresented: $vm.shouldShowAnnouncementPopup, view: {self.vm.createAnnouncementPopup()},
               customize: {
            $0
                .type(.default)
                .position(.top)
                .animation(.bouncy)
                .closeOnTap(false)
                .closeOnTapOutside(true)
        })
        
        // 캘린더 팝업
        .popup(isPresented: $vm.shouldShowCalendarPopup, view: {self.vm.createCalendarPopup()},
               customize: {
            $0
                .type(.default)
                .position(.top)
                .animation(.bouncy)
                .closeOnTap(false)
                .closeOnTapOutside(true)
        })
        
    }
}
#Preview {
    HomeView()
}
