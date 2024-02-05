//
//  SelectUniv.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/9/24.
//

import SwiftUI

struct SelectUniv:View {
    var Univs = ["가천대학교", "가톨릭대학교", "경기대학교", "경상국립대학교", "경희대학교", "광운대학교", "덕성여자대학교", "동국대학교", "동덕여자대학교", "명지대학교", "부경대학교", "상명대학교", "서경대학교", "서울여자대학교", "성신여자대학교", "숙명여자대학교", "숭실대학교", "아주대학교", "울산대학교", "이화여자대학교", "인하대학교", "중앙대학교", "한국공학대학교", "한국외국어대학교", "한국항공대학교", "한성대학교", "한양대학교", "한양대에리카", "홍익대학교"]
    @State var selectedUniv: String? = nil
    
    var body: some View {
        ZStack {
            Image("signup_background")
                .resizable()
            
            VStack {
                Spacer().frame(height: 140)
                
                VStack{
                    Text("학교를 입력해주세요")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Spacer().frame(height: 16)
                    
                    
                    DropDownPicker(selection: $selectedUniv, options: Univs, placeholder: "학교 선택을 기다리고 있어요!")
                }
                .padding()
                
                Spacer().frame(height:373)
                
                // 초대코드 또는 QR 인증이 완료되면 보이는 버튼
                if ((selectedUniv?.isEmpty) != nil) {
                    JoinNavigationButton(destination: SelectGeneration())                    }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}
