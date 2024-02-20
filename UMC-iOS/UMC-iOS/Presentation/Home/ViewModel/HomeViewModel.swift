//
//  HomeViewModel.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/17.
//

import Foundation
import SwiftUI

class HomeViewModel:ObservableObject {
    @Published var currentDate: Date = Date() // 캘린더 날짜 변수
    @Published var shouldShowCalendarPopup: Bool = false // 캘린더 팝업 뷰 State변수
    @Published var shouldShowAnnouncementPopup: Bool = false // 공지사항 팝업 뷰 State변수
    @Published var shouldShowGithubPopup: Bool = false //깃허브 팝업 뷰
    @Published var githubId: String = ""
    @Published var member = Member()
    @Published var todoLists: [TodoList] = []
    
    @Published var scheduleDetails: [ScheduleResponse.GetSchedulesDetail] = []
    //    @Published var todoList =
    
    func createGithubPopup() -> some View {
        let popupTitle: String = "[알림] GitHub"
        let popupMainText: String = "GitHub 로그인이필요합니다"
        @State var textInput: String = ""
        
        return ZStack {
            VStack(spacing: 0) {
                
                Text(popupTitle)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color.main2)
                
                Text(popupMainText)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .padding(.top, 16)
                
                TextField("Github ID", text: $textInput)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.historyDisabledGray)
                
                HStack {
                    Button {
                        self.githubId = textInput
                        print(self.githubId)
                        print(textInput)
                        self.shouldShowGithubPopup = false
                    } label : {
                        Text("확인")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(Color.tdlGray)
                    } // Button
                    .padding(.top, 24)
                    Button {
                        self.shouldShowGithubPopup = false
                    } label : {
                        Text("닫기")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(Color.tdlGray)
                    } // Button
                    .padding(.top, 24)
                }
                
                
            } // VStack
            .multilineTextAlignment(.center)
            .frame(width: 248, height: 180)
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(12.0)
            
        } // ZStack
        .multilineTextAlignment(.center)
        .padding(.top, 288)
    }
    
    
    
    func createAnnouncementPopup(noticeInfo: BoardResponse.PinnedNotice) -> some View { // 공지사항 팝업 뷰 만드는 함수
        let popupTitle: String = "[교내]12월 26일 회식 개최!"
        let popupMainText: String = "안녕하세요 여러분 벡스입니다~!!!!\n드디어 회식을 개최하게 되었는데요!!!!\n많은 참여 부탁드립니다!!!"
        let popupDate: String = "23.12.26"
        let popupTime: String = "오후 06:00"
        let popupLocation: String = "수꼬치 인하대 후문점"
        
        return ZStack {
            VStack(spacing: 0) {
                
                Text(noticeInfo.hostType)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color.main2)
                
                Text(noticeInfo.title)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color.main2)
                
                Text(noticeInfo.content)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .padding(.top, 16)
                
                //                HStack(spacing: 2) {
                //                    Text("⏰" + noticeInfo.nickname)
                //                    Text("|")
                //                    Text(popupTime)
                //                } // HStack
                //                .font(.system(size: 12))
                //                .fontWeight(.light)
                //                .foregroundColor(Color.tdlGray)
                //                .padding(.top, 16)
                
                //                Text("🏠" + popupLocation)
                //                    .font(.system(size: 12))
                //                    .fontWeight(.light)
                //                    .foregroundColor(Color.tdlGray)
                //                    .padding(.top, 4)
                
                Button {
                    self.shouldShowAnnouncementPopup = false
                } label : {
                    Text("닫기")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.tdlGray)
                } // Button
                .padding(.top, 24)
                
            } // VStack
            .multilineTextAlignment(.center)
            .frame(width: 248, height: 180)
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(12.0)
            
        } // ZStack
        .multilineTextAlignment(.center)
        .padding(.top, 288)
    }
    
    
    
    func createCalendarPopup(scheduleDetails: [ScheduleResponse.GetSchedulesDetail]) -> AnyView { // 캘린더 팝업 뷰 만드는 함수
        
        //        var popupDate: String = ""
        //        var popupTitle: String = ""
        //        var popupMainText: String = ""
        //        var popupWriter: String = ""
        //
        //        guard let task = calendarTasks.first(where: { taskIndex in
        //            return isSameDay(date1: taskIndex.taskDate, date2: currentDate)
        //        }) else {
        //            return AnyView(EmptyView())
        //        }
        //
        //        for index in task.calendarTasks {
        //            popupDate = formattedDateString(date: currentDate)
        //            popupTitle = index.title
        //            popupMainText = index.mainText
        //            popupWriter = "from.회장 \(index.writer)"
        //
        //
        //        }
        
        return AnyView(ZStack {
            VStack(spacing: 0) {
                TabView {
                    ForEach(scheduleDetails.indices, id: \.self) { index in
                        VStack(spacing: 0) {
                            Text(scheduleDetails[index].startDateTime)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color.main2)
                            
                            Text(scheduleDetails[index].title)
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(Color.main2)
                                .padding(.top, 6)
                            
                            Text(scheduleDetails[index].content)
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                                .padding(.top, 16)
                            
                            Text(scheduleDetails[index].writerNickname)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .foregroundColor(Color.tdlGray)
                                .padding(.top, 8)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(width: 248, height: 165)
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
                
                
                Button {
                    print(self.scheduleDetails)
                    self.scheduleDetails = []
                    self.shouldShowCalendarPopup = false
                } label : {
                    Text("닫기")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.tdlGray)
                } // Button
                .padding(.top, 24)
                
            } // VStack
            .frame(width: 248)
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(12.0)
            
        } // ZStack
            .multilineTextAlignment(.center)
            .padding(.top, 288))
    }
    
    func formattedDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //        dateFormatter.dateFormat = "MM/dd (E)"
        //        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

extension HomeViewModel {
    
    // API
    
    
    
    
    
    
}
