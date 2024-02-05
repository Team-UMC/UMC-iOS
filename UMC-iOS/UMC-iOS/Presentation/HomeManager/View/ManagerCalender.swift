//
//  ManagerCalender.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/12/24.
//

import SwiftUI

struct ManagerCalender:View {
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
                    TextField("제목", text: $CalTitle)
                    Divider()
                    TextField("", text: $CalContent, prompt: Text("내용")
                    )
                    .frame(height: 180, alignment: .topLeading)
                }
                .padding()
                .background(.white)
                .cornerRadius(12)
                                
                VStack{
                    HStack {
                        DatePicker(
                              "시작일",
                              selection: $StartDate,
                              displayedComponents: [.date, .hourAndMinute]
                        )
                        .accentColor(.main)
                    }
                Divider()
                    HStack{
                        DatePicker(
                              "종료일",
                              selection: $FinishDate,
                              displayedComponents: [.date, .hourAndMinute]
                        )
                        .accentColor(.main)
                        
                    }
                }
                .padding(10)
                .background(.white)
                .cornerRadius(12)
                
                //장소설정 TextField
                TextField("장소설정", text: $CalSpot)
                    .padding(10)
                    .background(.white)
                    .cornerRadius(12)
                
                VStack(alignment: .leading){
                    Text("분류")
                    HStack{
                        CircleFillButton(title: "전체")
                        CircleFillButton(title: "이전기수")
                        CircleFillButton(title: "현재기수")
                    }
                Divider()
                    HStack{
                        CircleFillButton(title: "학교")
                        CircleFillButton(title: "지부")
                        CircleFillButton(title: "연합")
                    }
                }
                               
                .padding()
                .background(.white)
                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
        }
        .modifier(SettingBackButton(title: "캘린더 추가", onDismiss: { dismiss() }, showTrailingItem: true))
        
    }
}

#Preview {
    ManagerCalender()
}
