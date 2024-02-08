//
//  CalendarResponse.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/02/08.
//

import Foundation

class CalendarResponse {
    
    // 캘린더 조회 API
    struct GetCalendar: Codable {
        
        let id: Int?
        let schedules: [Schedules]
        
    }
    
    // 일정 조회 (상세 조회)
    struct GetSchedulesDetail: Codable {
        
        let id: Int?
        let scheduleId: String
        let writerName: String
        let writerNickname: String
        let title: String
        let content: String
        let startDateTime: String
        let endDateTime: String
        let placeSetting: String
        let hostType: String
        
    }
    
}

extension CalendarResponse {
    
    // 캘린더 조회 API - [Schedules]
    struct Schedules: Codable {
        
        let scheduleId: String
        let startDateTime: String
        let endDateTime: String
        let hostType: String
        
    }
    
}
