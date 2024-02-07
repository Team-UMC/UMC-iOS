//
//  ManagerInfo.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/12/24.
//

import SwiftUI

struct ManagerInfo:View {
    @Environment(\.dismiss) private var dismiss
    @State private var isChecked = false
    @State private var UserFindString:String = ""
    @State var selectedGeneration: String? = nil
    @State var selectedPart: String? = nil
    @EnvironmentObject var viewModel: GenerationPartViewModel

    let UnivPositions = ["회장", "부회장", "운영국장", "PM 파트장", "Design 파트장", "Spring 파트장", "Node 파트장", "Web 파트장", "iOS 파트장", "Android 파트장",]
    
    let Generations = ["1기", "2기", "3기", "4기", "5기", "6기"]
    let Parts = ["PM", "Design", "Spring", "Node", "Web", "iOS", "Android"]

    
    var body: some View {
        ZStack{
            Color.textfieldBack.ignoresSafeArea()
            ScrollView {
                VStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .padding(8)
                        TextField("", text: $UserFindString, prompt: Text("정보를 변경할 챌린저를 검색해주세요.")
                            .foregroundStyle(.prompt)
                        )
                    }
                    .frame(width: 343, height: 38)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    VStack(alignment:.leading){
                        Text("운영진 직책")
                        Text("학교")
                        ForEach(0..<3, id: \.self) { row in
                            HStack(spacing: 8) {
                                if row == 0 {
                                    // 첫 번째 행에 4개의 버튼 출력
                                    ForEach(0..<4, id: \.self) { column in
                                        let index = row * 4 + column
                                        if index < UnivPositions.count {
                                            let title = UnivPositions[index]
                                            CircleCheckButton( title: title, darkColor: true, action: {})
                                        }
                                    }
                                } else {
                                    // 나머지 행에 각각 3개의 버튼 출력
                                    ForEach(0..<3, id: \.self) { column in
                                        let index = row * 3 + column + 1
                                        if index < UnivPositions.count {
                                            let title = UnivPositions[index]
                                            CircleCheckButton( title: title, darkColor: true, action: {})
                                        }
                                    }
                                }
                            }
                        }
                        CirclePlusButton(title:"직책추가")
                            .padding(.vertical, 10)
                        
                        Text("중앙")
                        ForEach(0..<3, id: \.self) { row in
                            HStack(spacing: 8) {
                                if row == 0 {
                                    // 첫 번째 행에 4개의 버튼 출력
                                    ForEach(0..<4, id: \.self) { column in
                                        let index = row * 4 + column
                                        if index < UnivPositions.count {
                                            let title = UnivPositions[index]
                                            CircleCheckButton( title: title, darkColor: true, action: {})
                                        }
                                    }
                                } else {
                                    // 나머지 행에 각각 3개의 버튼 출력
                                    ForEach(0..<3, id: \.self) { column in
                                        let index = row * 3 + column + 1
                                        if index < UnivPositions.count {
                                            let title = UnivPositions[index]
                                            CircleCheckButton( title: title, darkColor: true, action: {})
                                        }
                                    }
                                }
                            }
                        }
                        CirclePlusButton(title:"직책추가")
                            .padding(.vertical, 10)
                        Divider()
                    
                        
                        Text("기수 및 파트")
                        
                        HStack {
                            Image(systemName: "minus.circle.fill")
                                .font(.system(size: 14))
                                .foregroundStyle(Color(.lightGray))
                            DropDownPicker(selection: $selectedGeneration, options: Generations, maxWidth: 91, height: 29,  minHeight: 150,fontSize: 14, placeholder: "기수", BackColor: .energy, TextColor: .main, border: false)
                            DropDownPicker(selection: $selectedPart, options: Parts, maxWidth: 114, height: 29,  minHeight: 150, fontSize: 14, placeholder: "파트", BackColor: .energy, TextColor: .main, border: false)
                            
                            CirclePlusButton(title:"추가", leftText: true, fillPlus: true, TextColor: .main, iconColor: .main)
                                .frame(width: 74, height: 29)
                                .background(.energy)
                                .cornerRadius(12)
                                .foregroundStyle(.main)

                        }
                        .zIndex(1)
                        HStack {
                            Image(systemName: "minus.circle.fill")
                                .font(.system(size: 14))
                                .foregroundStyle(Color(.lightGray))
                            DropDownPicker(selection: $selectedGeneration, options: Generations, maxWidth: 91, height: 29,  minHeight: 150,fontSize: 14, placeholder: "기수", BackColor: .energy, TextColor: .main, border: false)
                            DropDownPicker(selection: $selectedPart, options: Parts, maxWidth: 114, height: 29,  minHeight: 150, fontSize: 14, placeholder: "파트", BackColor: .energy, TextColor: .main, border: false)
                            
                            CirclePlusButton(title:"추가", leftText: true, fillPlus: true, TextColor: .main, iconColor: .main)
                                .frame(width: 74, height: 29)
                                .background(.energy)
                                .cornerRadius(12)
                                .foregroundStyle(.main)

                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(12)
                    .padding()
                    
                    
                }
                
            
            }

        }
        .modifier(SettingBackButton(title: "챌린저 정보 변경", onDismiss: { dismiss() }, showTrailingItem: true))
    }
}

#Preview {
    ManagerInfo()
}
