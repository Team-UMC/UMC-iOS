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
                Text("전체 학교 조회 조회")
            }
        }
    }
}

#Preview {
    ScheduleAPITestView()
}
