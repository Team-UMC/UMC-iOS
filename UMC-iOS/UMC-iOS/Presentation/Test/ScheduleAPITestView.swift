//
//  ScheduleAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import SwiftUI

struct ScheduleAPITestView: View {
    @ObservedObject var scheduleNetwork = ScheduleNetwork()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await scheduleNetwork.fetchGetCalendar(request: ScheduleRequest.GetCalendar(date: "2024-02-13"))
                }
            } label: {
                Text("전체 학교 조회")
            }
            
            Button {
                Task {
                    await scheduleNetwork.fetchCreateSchedule(request: ScheduleRequest.CreateSchedule(title: "TEST", content: "TEST", startDateTime: "2024-02-13T08:08:41", endDateTime: "2024-02-15T08:08:41", semesterPermission: [Semester.FIFTH.rawValue], hostType: HostType.CENTER.rawValue, placeSetting: "인하대"))
                }
            } label: {
                Text("일정 추가")
            }
            
            
        }
    }
}

#Preview {
    ScheduleAPITestView()
}
