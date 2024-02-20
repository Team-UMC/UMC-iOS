//
//  ScheduleAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import SwiftUI

struct ScheduleAPITestView: View {
//    @ObservedObject var scheduleNetwork = ScheduleNetwork()
    @State private var deleteScheduleId: String = ""
    @State private var updateScheduleId: String = ""
    @State private var getScheduleDetailScheduleId: String = ""
    
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await ScheduleNetwork.fetchGetCalendar(request: ScheduleRequest.GetCalendar(date: "2024-02-13"))
                }
            } label: {
                Text("캘린더 조회")
            }
            
            Button {
                Task {
                    await ScheduleNetwork.fetchCreateSchedule(request: ScheduleRequest.CreateSchedule(title: "TEST", content: "TEST", startDateTime: "2024-02-13T08:08:41", endDateTime: "2024-02-15T08:08:41", semesterPermission: [Semester.FIFTH.rawValue], hostType: HostType.CENTER.rawValue, placeSetting: "인하대"))
                }
            } label: {
                Text("일정 추가")
            }
            TextField("수정할 캘린더 아이디를 입력하세요.", text: $updateScheduleId)
            
            Button {
                Task {
                    await ScheduleNetwork.fetchUpdateSchedule(scheduleId: updateScheduleId, request: ScheduleRequest.UpdateSchedule(title: "TEST", content: "TEST", startDateTime: "2024-02-13T08:08:41", endDateTime: "2024-02-15T08:08:41", semesterPermission: [Semester.FIFTH.rawValue], hostType: HostType.CENTER.rawValue, placeSetting: "가천대"))
                }
            } label: {
                Text("일정 수정")
            }
            
            TextField("상세 조회할 캘린더 아이디를 입력하세요.", text: $getScheduleDetailScheduleId)
            
            Button {
                Task {
                    await ScheduleNetwork.fetchGetScheduleDetail(scheduleId: getScheduleDetailScheduleId)
                }
            } label: {
                Text("일정 상세 조회")
            }
            
            TextField("삭제할 캘린더 아이디를 입력하세요.", text: $deleteScheduleId)
            
            Button {
                Task {
                    await ScheduleNetwork.fetchDeleteSchedule(request: ScheduleRequest.DeleteSchedule(scheduleId: deleteScheduleId))
                }
            } label: {
                Text("일정 삭제")
            }
            
        }
    }
}

#Preview {
    ScheduleAPITestView()
}
