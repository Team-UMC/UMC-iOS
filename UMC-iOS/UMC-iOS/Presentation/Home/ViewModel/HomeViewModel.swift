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
    @Published var member = Member()
    @Published var toDoLists: [TodoList] = []
//    @Published var todoList =
    
    func createAnnouncementPopup() -> some View { // 공지사항 팝업 뷰 만드는 함수
        let popupTitle: String = "[교내]12월 26일 회식 개최!"
        let popupMainText: String = "안녕하세요 여러분 벡스입니다~!!!!\n드디어 회식을 개최하게 되었는데요!!!!\n많은 참여 부탁드립니다!!!"
        let popupDate: String = "23.12.26"
        let popupTime: String = "오후 06:00"
        let popupLocation: String = "수꼬치 인하대 후문점"
        
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
                
                HStack(spacing: 2) {
                    Text("⏰" + popupDate)
                    Text("|")
                    Text(popupTime)
                } // HStack
                .font(.system(size: 12))
                .fontWeight(.light)
                .foregroundColor(Color.tdlGray)
                .padding(.top, 16)
                
                Text("🏠" + popupLocation)
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .foregroundColor(Color.tdlGray)
                    .padding(.top, 4)
                
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
    
    func createCalendarPopup() -> some View { // 캘린더 팝업 뷰 만드는 함수
        var popupDate: String = ""
        var popupTitle: String = ""
        var popupMainText: String = ""
        var popupWriter: String = ""
        
        if let task = calendarTasks.first(where: { taskIndex in
            return isSameDay(date1: taskIndex.taskDate, date2: currentDate)
        }) {
            for index in task.calendarTasks {
                popupDate = formattedDateString(date: currentDate)
                popupTitle = index.title
                popupMainText = index.mainText
                popupWriter = "from.회장 \(index.writer)"
            }
        } else {
            popupDate = ""
            popupTitle = ""
            popupMainText = ""
            popupWriter = ""
        }
        
        return ZStack {
            VStack(spacing: 0) {
                
                Text("\(popupDate)")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color.main2)
                
                Text(popupTitle)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color.main2)
                    .padding(.top, 6)
                
                Text(popupMainText)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .padding(.top, 16)
                
                Text(popupWriter)
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .foregroundColor(Color.tdlGray)
                    .padding(.top, 8)
                
                Button {
                    self.shouldShowCalendarPopup = false
                } label : {
                    Text("닫기")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.tdlGray)
                } // Button
                .padding(.top, 24)
                
            } // VStack
            .frame(width: 248, height: 165)
            .padding(.vertical, 24)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(12.0)
            
        } // ZStack
        .multilineTextAlignment(.center)
        .padding(.top, 288)
    }
    
    func formattedDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd (E)"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

extension HomeViewModel {
    
    // API
    
    // GET
    // 멤버 API - 유저 프로필 조회 API(fetch)
    @MainActor
    func fetchGetMemberProfile() async {
        do {
            let memberProfile = try await getMemberProfile()
            print(memberProfile)
            member = Member(memberProfile: memberProfile)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 멤버 API - 유저 프로필 조회 API
    func getMemberProfile() async throws -> MemberResponse.GetMemberProfile {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.members.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badResponse
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<MemberResponse.GetMemberProfile>.self, from: data)
        
        var memberProfile: MemberResponse.GetMemberProfile
        memberProfile = jsonDictionary.result
        
        return memberProfile
    }
    
    // TodoList API - 투두리스트 조회 API(fetch)
    @MainActor
    func fetchGetTodoList() async {
        do {
            let toDoList = try await getTodoList()
            print(toDoList)
            self.toDoLists = toDoList.todoLists.mapToToDoList()
        } catch {
            print("Error: \(error)")
        }
    }
    
    // TodoList API - 투두리스트 조회 API
    func getTodoList() async throws -> TodoListResponse.GetTodoList {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.queryItems = [URLQueryItem(name: "date", value: String.currentLocalDateToString())]
        urlComponents.path = ApiEndpoints.Path.todoList.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badResponse
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<TodoListResponse.GetTodoList>.self, from: data)
        
        var todoLists: TodoListResponse.GetTodoList
        todoLists = jsonDictionary.result
        
        return todoLists
    }
    
    
}
