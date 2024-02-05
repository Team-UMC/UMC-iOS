    //
    //  ManagerSetting.swift
    //  UMC-iOS
    //
    //  Created by 이태현 on 1/12/24.
    //

    import SwiftUI

    struct ManagerSetting:View {
        @State private var isPressed: Bool = false
        @State private var isPressed2: Bool = false
        @State private var isPressed3: Bool = false
        @Environment(\.dismiss) private var dismiss
        
        var body: some View {
                VStack{
                    Button(action: {
                        isPressed.toggle()
                    }, label: {Text("공지사항 핀 설정")
                            .foregroundStyle(.black)
                        Spacer()
                    })
                    .padding(.vertical, 16)
                    .navigationDestination(isPresented: $isPressed){ ManagerPin()}
                    
                    Divider()
                    
                    Button(action: {
                        isPressed2.toggle()
                    }, label: {Text("캘린더 추가")
                            .foregroundStyle(.black)
                        Spacer()
                    })
                    .padding(.vertical, 16)
                    .navigationDestination(isPresented: $isPressed2){ ManagerCalender()}
                    
                    Divider()
                    
                    Button(action: {
                        isPressed3.toggle()
                    }, label: {Text("챌린저 정보 변경")
                            .foregroundStyle(.black)
                        Spacer()
                    })
                    .padding(.vertical, 16)
                    .navigationDestination(isPresented: $isPressed3){ ManagerInfo()}
                    
                    Divider()
                    Spacer()
                }
                .padding(16)
                
            
                .modifier(SettingBackButton(title: "운영진 설정", onDismiss: { dismiss() }, showTrailingItem: false))
        }
    }

