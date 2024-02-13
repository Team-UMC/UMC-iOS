//
//  ScheduleRequest.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

struct ScheduleRequest {
    struct GetCalendar: Codable {
        let date: String
    }
    
    struct CreateSchedule: Codable {
        let title: String
        let content: String
        let startDateTime: String
        let endDateTime: String
        let semesterPermission: [String]
        let hostType: String
        let placeSetting: String
    }
    
    struct DeleteSchedule: Codable {
        let scheduleId: String
    }
}
