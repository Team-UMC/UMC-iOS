//
//  MainCalendarView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI
import PopupView

struct MainCalendarView: View {
    @ObservedObject var scheduleNetwork = ScheduleNetwork()
    
    @State var calendarInfo: ScheduleResponse.GetCalendar = ScheduleResponse.GetCalendar()
    @Binding var scheduleDetailInfos: [ScheduleResponse.GetSchedulesDetail]
    @Binding var calendarTasks: [TaskMetaData]
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0 // 화살표 버튼 클릭시 월 업데이트
    @State var monthTap: Int = 0 // 날짜를 눌렀을 때 currentMonth와 동기화
    
    
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
                HStack(spacing: 28) { // 월, 버튼
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
                            currentDate = getCurrentMonth()
                            print("현재 날짜 \(currentDate)")
                        }
                        Task {
                            calendarInfo = await scheduleNetwork.fetchGetCalendar(request: ScheduleRequest.GetCalendar(date: String.dateToString(date: currentDate)))
                            calendarTasks = scheduleInfoListToTaskMetaData(calendarInfo: calendarInfo.schedules)
                        }
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundStyle(Color.main2)
                    } // Button
                    
                    Button { // 오른쪽 버튼, 다음 달
                        print("CalendarRightBtn Tapped")
                        
                        withAnimation {
                            currentMonth += 1
                            currentDate = getCurrentMonth()
                            print("현재 날짜 \(currentDate)")
                        }
                        Task {

                            calendarInfo = await scheduleNetwork.fetchGetCalendar(request: ScheduleRequest.GetCalendar(date: String.dateToString(date: currentDate)))
                            calendarTasks = scheduleInfoListToTaskMetaData(calendarInfo: calendarInfo.schedules)
                        }
                        
                        
                        
                    } label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
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
                                    .opacity(isSameDay(date1: value.date, date2: currentDate) && (currentMonth == monthTap) ? 1 : 0)
                            )
                            .onTapGesture {
                                currentDate = value.date
                                monthTap = currentMonth
                                print("날짜 정보 : \(currentDate.formatted())")
                                
                                // 일정이 있는 경우에 shouldShowPopup = true 없다면 false
                                if let task = calendarTasks.first(where: { task in
                                    return isSameDay(date1: task.taskDate, date2: currentDate)
                                }) {
                                    Task {
                                        for index in task.calendarTasks {
                                            var scheduleDetailInfo = await scheduleNetwork.fetchGetScheduleDetail(scheduleId: index.scheduleId)
                                            scheduleDetailInfos.append(scheduleDetailInfo)
                                        }
                                    }
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
                
                if let task = calendarTasks.first(where: { task in
                    
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
                        // .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? Color.white : Color.calendar)
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate)
                                         && (currentMonth == monthTap) ? Color.white : Color.calendar)
                        // .foregroundColor()
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

func scheduleInfoListToTaskMetaData(calendarInfo: [ScheduleResponse.ScheduleInfo]) -> [TaskMetaData] {
    var calendarParsingInfos: [ScheduleResponse.ScheduleInfo] = []
//    var calendarTasks: [TaskMetaData] = []
    
    for info in calendarInfo {
        let tempScheduleInfos = dateParsing(scheduleInfo: info)
        for temp in tempScheduleInfos {
            calendarParsingInfos.append(temp)
        }
    }
    
    print("calendarParsingInfos------------------------\n\n\n\(calendarParsingInfos)")
    
    return convertToTaskMetaData(from: calendarParsingInfos)
}


func convertToTaskMetaData(from scheduleInfos: [ScheduleResponse.ScheduleInfo]) -> [TaskMetaData] {
    // 날짜별로 ScheduleInfo 그룹화
    let groupedByDate = Dictionary(grouping: scheduleInfos) { $0.startDateTime }
    
    print("groupedByDate : ------------------------\n\(groupedByDate)")
    
    // 각 그룹을 TaskMetaData로 변환
    var taskMetaDatas: [TaskMetaData] = []
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    
    for (dateString, schedules) in groupedByDate {
        guard let taskDate = dateFormatter.date(from: dateString) else {
            print("error")
            continue
        }
        
        let calendarTasks = schedules.map { schedule -> CalendarTask in
            CalendarTask(
                scheduleId: schedule.scheduleId,
                dateTime: taskDate,
                title: "Title Placeholder", // 실제 사용시 적절한 제목으로 대체 필요
                mainText: "MainText Placeholder", // 실제 사용시 적절한 본문으로 대체 필요
                writer: "Writer Placeholder", // 실제 사용시 적절한 작성자로 대체 필요
                hostType: HostType(rawValue: schedule.hostType.uppercased()) ?? HostType.CAMPUS // hostType 파싱
            )
        }
        
        print("calendarTasks ------------------------\n \(calendarTasks)")
        
        let taskMetaData = TaskMetaData(calendarTasks: calendarTasks, taskDate: taskDate)
        
        print("taskMetaData ------------------------\n\n\n\n \(taskMetaData)")
        taskMetaDatas.append(taskMetaData)
    }
    
    print("taskMetaDatas ------------------------\n\n\n\n \(taskMetaDatas)")
    
    return taskMetaDatas
}


func dateParsing(scheduleInfo: ScheduleResponse.ScheduleInfo) -> [ScheduleResponse.ScheduleInfo] {
    
//    let scheduleInfo = ScheduleResponse.ScheduleInfo(scheduleId: "042b7712-1855-4d65-b30a-4dca63762feb", startDateTime: "2024-02-19T00:00:00", endDateTime: "2024-02-21T23:59:00", hostType: "CENTER")
    // ISO 8601 날짜 포맷터
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    print(scheduleInfo)
    
    // 시작 및 종료 날짜 파싱
    if let startDateTime = dateFormatter.date(from: scheduleInfo.startDateTime),
       let endDateTime = dateFormatter.date(from: scheduleInfo.endDateTime) {
        
        // 날짜 범위 생성
        var currentDate = startDateTime
        let calendar = Calendar.current
        var datesBetween: [Date] = []
        
        while currentDate <= endDateTime {
            datesBetween.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        // 각 날짜별로 일정 매핑
        let schedulesByDate = datesBetween.map { date -> ScheduleResponse.ScheduleInfo in
            var scheduleCopy = scheduleInfo
            scheduleCopy.startDateTime = dateFormatter.string(from: date)
            scheduleCopy.endDateTime = dateFormatter.string(from: date)
            return scheduleCopy
        }
        
        // 결과 출력
//        print("log : \(schedulesByDate)")
        return schedulesByDate
    }
    return []
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

//#Preview {
//    HomeView()
//}
