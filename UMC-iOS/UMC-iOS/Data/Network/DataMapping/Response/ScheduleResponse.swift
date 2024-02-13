//
//  ScheduleResponse.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/02/08.
//

import Foundation

class ScheduleResponse {
    
    // 캘린더 조회 API
    struct GetCalendar: Codable {
        
        let id: Int?
        let schedules: [ScheduleInfo]
        
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

extension ScheduleResponse {
    
    // 캘린더 조회 API - [ScheduleInfo]
    struct ScheduleInfo: Codable {
        
        let scheduleId: String
        let startDateTime: String
        let endDateTime: String
        let hostType: String
        
    }
    
}
