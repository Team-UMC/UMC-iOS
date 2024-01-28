//
//  MainCalendarViewModel.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/28.
//

import Foundation
import SwiftUI

extension MainCalendarView {
    @MainActor class ViewModel: ObservableObject {
        @Published var currentMonth: Int = 0 // 화살표 버튼 클릭시 월 업데이트
        
        
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
