//
//  MainCalendarView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI
import PopupView

struct MainCalendarView: View {
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0 // 화살표 버튼 클릭시 월 업데이트
    
    @Binding var shouldShowCalendarPopup: Bool
   
    
    let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let colums = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        ZStack { // 달력 배경, 달력, 팝업 ZStack
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .frame(height: .infinity)
                .padding(.horizontal, 18)
                .shadow(color: Color.gray.opacity(0.5), radius: 6, x: 0, y: 2)
            
            VStack(spacing: 4) { // 달력 전체
                HStack(spacing: 10) { // 월, 버튼
                    VStack(alignment: .leading, spacing: 0) {
                        Text(extraDate()[0]) // January .. Febuary ...
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.main2)
                    } // VStack
                    
                    Spacer(minLength: 0)
                    
                    Button { // 왼쪽 버튼, 이전 달
                        print("CalendarLeftBtn Tapped")
                        
                        withAnimation {
                            currentMonth -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .foregroundStyle(Color.main2)
                    } // Button
                    
                    Button { // 오른쪽 버튼, 다음 달
                        print("CalendarRightBtn Tapped")
                        withAnimation {
                            currentMonth += 1
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .foregroundStyle(Color.main2)
                    } // Button
                    
                } // HStack
                .padding(.horizontal, 16) // 월 좌우 패딩
                .padding(.bottom, 4) // 월 하단 패딩
                
                // Day View 주
                HStack(spacing: 0) {
                    ForEach(days, id: \.self){day in
                        Text(day)
                            .font(.system(size: 14))
                            .foregroundStyle(Color.calendar)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity)
                    } // ForEach
                } // HStack
                .padding(.horizontal, 5) // 주 좌우 패딩
                .padding(.bottom, 10) // 주 하단 패딩
                
                // 일 31
                LazyVGrid(columns: colums, spacing: 0) {
                    ForEach(extractDate()) { value in
                        
                        CardView(value: value)
                            .background(
                                Capsule() // 타원
                                    .fill(Color.main2)
                                    .padding(.top, -4)
                                    .padding(.bottom, 6)
                                    .padding(.horizontal, 10)
                                    .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                                    //.opacity((currentMonth == 0) ? 1 : 0)
                            )
                            .onTapGesture {
                                currentDate = value.date
                                print("날짜 정보 : \(currentDate.formatted())")
                                
                                // 일정이 있는 경우에 shouldShowPopup = true 없다면 false
                                if let task = tasks.first(where: { task in
                                    return isSameDay(date1: task.taskDate, date2: currentDate)
                                }) {
                                    self.shouldShowCalendarPopup = true
                                } else {
                                    self.shouldShowCalendarPopup = false
                                }

                            }
                    }
                } // LazyVGrid
                .padding(.horizontal, 9) // 일 좌우 패딩
                
                Spacer()
                
            } // VStack
            .padding(.horizontal, 20) // 달력 전체 패딩
            .padding(.top, 22) // 달력 전체 패딩
            .onTapGesture {
                print("Tapped")
            }
            
        } // ZStack
        // 달 업데이트
        .onChange(of: currentMonth) {
            currentDate = getCurrentMonth()
            
        }
    }
    
    // 일 31개 ViewBuilder
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack(spacing: 0) {
            if value.day != -1 {
                
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate,
                                     date2: value.date)
                }) { // Task 존재할 때
                    Text("\(value.day)")
                        .font(.system(size: 12))
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? Color.white : Color.calendar)
                        .frame(maxWidth: .infinity)
                        .fontWeight(.regular)
                    
                    
                    Circle() // 할일 학교 지부마다 색 다르게 구현필요
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? Color.white: Color.main2)
                        .frame(width: 6, height: 6)
                        .padding(.top, 4)
                        
                    
                } else { // Task 없을 때
                    Text("\(value.day)")
                        .font(.system(size: 12))
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? Color.white : Color.calendar)
                        .frame(maxWidth: .infinity)
                        .fontWeight(.regular)
                    
                }
            }
        } // VStack
        .frame(height: 38, alignment: .top) // 일 한개당 높이 38
        
    }
    // 날짜 확인
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    
    // 달력에 년도, 월 나타내기
    func extraDate() -> [String] {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"  // 년도와 월
        
        // let date = formatter.string(from: currentDate)
        let date = formatter.string(from: getCurrentMonth())
        
        return date.components(separatedBy: " ") // extraDate[0] == 년도, [1] == 월
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        // 현재 월, 날 가져오기
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue]{
        let calendar = Calendar.current
        
        // 현재 월, 날 가져오기
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            // 일 받아오기
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
}


extension Date {
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        // 시작 날짜 받기
        let startDate = calendar.date(from: Calendar.current.dateComponents(
            [.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        // date 받기
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
            
        }
    }
}

#Preview {
    HomeView()
}
