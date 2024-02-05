//
//  ManagerPin.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/12/24.
//

import SwiftUI

struct ManagerPin:View {
    @Environment(\.dismiss) private var dismiss
    @State private var pinFindString:String = ""
    @State private var ischecked:Bool = false
    @State private var ischecked2:Bool = false
    @State private var ischecked3:Bool = false

    var body: some View {
        
        VStack(spacing:20){
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(8)
                TextField("", text: $pinFindString, prompt: Text("글 제목, 내용을 입력해주세요.")
                    .foregroundStyle(.prompt)
                )
            }
            .frame(width: 343, height: 38)
            .background(Color(.textfieldBack))
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.top, 10)

            
            
            //나중에 데이터를 받아오면 List or forEach로 감싸서 구현해주기.
            VStack(spacing: 20){
                ManagerPinButton(Sortedpart: "교내", title: "프로젝트 관련 공지사항입니다."){}
                ManagerPinButton(Sortedpart: "연합", title: "데모데이 관련공지"){}
                ManagerPinButton(Sortedpart: "교내", title: "동방 관련해 공지합니다."){}
            }
            .padding(.horizontal)
            Spacer()
        }
        .modifier(SettingBackButton(title: "공지사항 핀 설정", onDismiss: { dismiss() }, showTrailingItem: true))
        
    }
}
