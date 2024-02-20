//
//  ManagerCalender.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/12/24.
//

import SwiftUI

struct ManagerCalender: View {
    
    // Api
//    @ObservedObject var scheduleNetwork = ScheduleNetwork()
    @State private var deleteScheduleId: String = ""
    @State private var updateScheduleId: String = ""
    @State private var getScheduleDetailScheduleId: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @State private var CalTitle: String = ""
    @State private var CalContent: String = ""
    @State private var CalSpot: String = ""
    @State private var isChecked:Bool = false
    @State var StartDate = Date()
    @State var FinishDate = Date()

    var body: some View {
        ZStack{
            //배경화면 색깔
            Color.textfieldBack.ignoresSafeArea()
            
            VStack(spacing: 16){
                VStack{
                    
                    // 내용
                    TextField("제목",
                              text: $CalTitle,
                              prompt: Text("제목")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .kerning(-0.5)
                        .foregroundColor(Color.buttonDisabled))
                    
                    Divider()
                        .foregroundColor(Color.settingDivider)
                    
                    // 내용
                    TextField("내용",
                              text: $CalContent,
                              prompt: Text("내용")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .kerning(-0.5)
                        .foregroundColor(Color.buttonDisabled))
                    .frame(height: 180, alignment: .topLeading)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(.white)
                .cornerRadius(12)
                                
                VStack(spacing: 8){
                    
                    HStack(spacing: 0) {
                        DatePicker(
                              "시작일",
                              selection: $StartDate,
                              displayedComponents: [.date, .hourAndMinute]
                        )
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .kerning(-0.5)
                        .accentColor(.main)
                        
                    }
                    
                Divider()
                        .foregroundColor(Color.settingDivider)
                    
                    HStack{
                        DatePicker(
                              "종료일",
                              selection: $FinishDate,
                              displayedComponents: [.date, .hourAndMinute]
                        )
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .kerning(-0.5)
                        .accentColor(.main)
                        
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(.white)
                .cornerRadius(12)
                
                //장소설정 TextField
                TextField("장소설정",
                          text: $CalSpot,
                          prompt: Text("장소설정")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .kerning(-0.5)
                    .foregroundColor(Color.buttonDisabled))
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(Color.white)
                .cornerRadius(12)
                
                // 분류 버튼
                VStack(alignment: .leading, spacing: 8){
                    
                    Text("분류")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                    
                    HStack(spacing: 16){
                        CircleFillButton(title: "전체")
                        CircleFillButton(title: "이전기수")
                        CircleFillButton(title: "현재기수")
                    }
                    
                Divider()
                        .foregroundColor(Color.settingDivider)
                    
                    HStack(spacing: 16){
                        CircleFillButton(title: "학교")
                        CircleFillButton(title: "지부")
                        CircleFillButton(title: "연합")
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(.white)
                .cornerRadius(12)
                
                // 임시 버튼
                Button {
                    
                    Task {
                        await ScheduleNetwork.fetchCreateSchedule(
                            request: ScheduleRequest.CreateSchedule(title: CalTitle,
                                                                    content: CalContent,
                                                                    startDateTime: convertDateToString(date: StartDate),
                                                                    endDateTime: convertDateToString(date: StartDate),
                                                                    semesterPermission: [Semester.FIFTH.rawValue],
                                                                    hostType: HostType.CENTER.rawValue,
                                                                    placeSetting: CalSpot)
                        )
                    }
                    
                } label: {
                    Text("Create Schedule Test")
                }
                
                Spacer()
            }
            .padding(16.5)
        }
        .modifier(SettingBackButton(title: "캘린더 추가", onDismiss: { dismiss() }, showTrailingItem: true))
        
    }
    
    func convertDateToString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.string(from: date)
        
    }
}

#Preview {
    ManagerCalender()
}

