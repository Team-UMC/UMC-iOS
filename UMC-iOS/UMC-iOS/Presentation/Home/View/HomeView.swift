//
//  HomeView.swift
//  UMCProject_Won
//
//  Created by 김승원 on 2024/01/10.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @ObservedObject var memberNetwork = MemberNetwork()
    @ObservedObject var scheduleNetwork = ScheduleNetwork()
    @ObservedObject var todoListNetwork = TodoListNetwork()
    @ObservedObject var todayILearendNetwork = TodayILearnedNetwork()
    
    @State private var presentSideMenu = false // 사이드 메뉴 표시 여부
    @State private var isNavigationBtnTapped: [Bool] = [false, false, false, false]
    
    // 추후 수정...(원래 DTO를 이런 식으로 갖다쓰면 안됩니다^^... 급하니까 중간과정 생략하고 때려박는거에요...)
    @State var memberProfile = MemberResponse.GetMemberProfile()
    @State var calendarInfo = ScheduleResponse.GetCalendar()
    @State var todoList = TodoListResponse.GetTodoList()
    @State var todayILearneds = TodayILearnedResponse.GetTodayILearned()
    
    @State var goToTodoList: Bool = false
    @State var goToTodayILearned: Bool = false
    @State var goToMyProfile: Bool = false
    @State var goToMenuView: Bool = false
    
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
                    
                    
                    HomeSideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(memberProfile: memberProfile ,presentSideMenu: $presentSideMenu, goToMyProfile: $goToMyProfile, goToMenuView: $goToMenuView)), direction: .leading)
                        .zIndex(1)
                    
                    
                    
                    
                    VStack(spacing: 0) {
                        Spacer().frame(height: 50)
                        HomeNavigationBarView(presentSideMenu: $presentSideMenu, isNavigationBtnTapped: $isNavigationBtnTapped).padding(.top, 7)
                        
                        UserInformationView(memberInfo: memberProfile).padding(.top, 20)
                        
                        AnnouncementView(shouldShowAnnouncementPopup: $viewModel.shouldShowAnnouncementPopup).padding(.top, 8)
                        
                        MainCalendarView(currentDate: $viewModel.currentDate, shouldShowCalendarPopup: $viewModel.shouldShowCalendarPopup).padding(.top, 8)
                        TodoSummaryListView(todoList: todoList, memberNickname: memberProfile.nickname, goToTodoList: $goToTodoList).padding(.top, 24)
                        
                        HStack(spacing: 18) {
                            if todayILearneds.todayILearnedInfos.isEmpty {
                                TodayILearnedEmptyView(goToTodayILearned: $goToTodayILearned, memberNickname: memberProfile.nickname)
                            } else {
                                TodayILearnedHomeList(todayILearneds: todayILearneds)
                            }
                            
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
        .onAppear {
            Task {
                memberProfile = await memberNetwork.fetchGetMemberProfile(memberId: "")
                calendarInfo = await scheduleNetwork.fetchGetCalendar(request: ScheduleRequest.GetCalendar(date: String.dateToString(date: viewModel.currentDate)))
                todoList = await todoListNetwork.fetchGetTodoList(date: String.currentLocalDateToString())
                todayILearneds = await todayILearendNetwork.fetchGetTodayILearned(date: String.currentLocalDateToString())
                
            }
        }
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
        .navigationDestination(isPresented: $goToTodoList) {
            ToDoListUI()
                .navigationBarBackButtonHidden()
        }
        .navigationDestination(isPresented: $goToTodayILearned) {
            TILUI()
                .navigationBarBackButtonHidden()
        }
        .navigationDestination(isPresented: $goToMyProfile) {
            UserProfileUI(memberProfile: memberProfile)
        }
        
    }
}
#Preview {
    HomeView()
}
