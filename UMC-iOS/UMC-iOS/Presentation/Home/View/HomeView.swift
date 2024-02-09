//
//  HomeView.swift
//  UMCProject_Won
//
//  Created by 김승원 on 2024/01/10.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var presentSideMenu = false // 사이드 메뉴 표시 여부
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ZStack {
                    Image("homeBackgroundImage") // 원형 배경
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                    // .offset(x: 0)
                        .position(x: UIScreen.main.bounds.width/2, y: 170)
                    
                    HomeSideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
                        .zIndex(1)
                    
                    VStack(spacing: 0) {
                        Spacer().frame(height: 50)
                        HomeNavigationBarView(presentSideMenu: $presentSideMenu).padding(.top, 7)
                        
                        UserInformationView().padding(.top, 20)
                        
                        AnnouncementView(shouldShowAnnouncementPopup: $viewModel.shouldShowAnnouncementPopup).padding(.top, 8)
                        
                        MainCalendarView(currentDate: $viewModel.currentDate, shouldShowCalendarPopup: $viewModel.shouldShowCalendarPopup).padding(.top, 8)
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
                .opacity(viewModel.shouldShowCalendarPopup || viewModel.shouldShowAnnouncementPopup ? 0.6 : 0) // 공지사항, 캘린더 둘 다 적용
                .edgesIgnoringSafeArea(.all)
            
        } // ZStack (최 상단에 팝업 뷰 배치)
        .ignoresSafeArea()
        // 공지사항 팝업
        .popup(isPresented: $viewModel.shouldShowAnnouncementPopup, view: {self.viewModel.createAnnouncementPopup()},
               customize: {
            $0
                .type(.default)
                .position(.top)
                .animation(.bouncy)
                .closeOnTap(false)
                .closeOnTapOutside(true)
        })
        
        // 캘린더 팝업
        .popup(isPresented: $viewModel.shouldShowCalendarPopup, view: {self.viewModel.createCalendarPopup()},
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
