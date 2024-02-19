//
//  CalendarTask.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/19.
//

import SwiftUI

// Task 배열
struct CalendarTask: Identifiable, Codable{
    var id = UUID().uuidString
    var scheduleId: String? = ""
    var dateTime: Date = Date() // 일단 현재 날짜
    var title: String // 일정 제목
    var mainText: String // 일정 본문
    var writer: String // 작성자
    var hostType: HostType // 학교,지부,연합 타입
}

// Total Task Meta View
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var calendarTasks: [CalendarTask] // 하루에 일정이 겹칠수도 있기 때문에 배열로 선언
    var taskDate: Date // 일정 날짜
}

// 임시 일정 데이터
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

// 임시 일정
//var calendarTasks: [TaskMetaData] = [
//    TaskMetaData(calendarTasks: [CalendarTask(title: "[연합] 데모데이 신청 마감",
//                             mainText: "데모데이 신청 마감일 입니다.\n잊지말고 신청해 주세요~🥳",
//                                              writer: "우디", hostType: HostType.BRANCH)],
//                 taskDate: getSampleDate(offset: 30)
//                )
//]
