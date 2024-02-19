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
        
        var id: Int? = 0
        var schedules: [ScheduleInfo] = []
        
    }
    
    // 일정 조회 (상세 조회)
    struct GetSchedulesDetail: Codable {
        
        var id: Int? = 0
        var scheduleId: String = ""
        var writerName: String = ""
        var writerNickname: String = ""
        var title: String = ""
        var content: String = ""
        var startDateTime: String = ""
        var endDateTime: String = ""
        var placeSetting: String = ""
        var hostType: String = ""
        
    }
    
    struct ScheduleId: Codable {
        var id: Int? = 0
        var scheduleId: String = ""
    }
    
}

extension ScheduleResponse {
    
    // 캘린더 조회 API - [ScheduleInfo]
    struct ScheduleInfo: Codable {
        
        var scheduleId: String = ""
        var startDateTime: String = ""
        var endDateTime: String = ""
        var hostType: String = ""
        
    }
    
}
