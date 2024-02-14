    //
    //  ManagerSetting.swift
    //  UMC-iOS
    //
    //  Created by 이태현 on 1/12/24.
    //

    import SwiftUI

    struct ManagerSetting:View {
        
        private let buttonNames: [String] = ["공지사항 핀 설정", "캘린더 추가", "챌린저 정보 변경", "히스토리 추가"]
        
        private let buttonViews: [AnyView] = [
        
            AnyView(ManagerPin()),
            AnyView(ManagerCalender()),
            AnyView(ManagerInfo()),
            AnyView(HistoryRegisterView())
        
        ]
        
        @State private var isTapped: [Bool] = [false, false, false, false]
        
        
        @Environment(\.dismiss) private var dismiss
        
        var body: some View {
            
            VStack(spacing: 0) {
                
                ForEach(Array(buttonNames.enumerated()), id: \.1) { index, name in
                    
                    VStack(spacing: 0) {
                        
                        HStack(spacing: 0) {
                            
                            Button {
                                print("\(name) Button Tapped")
                                isTapped[index].toggle()
                            } label: {
                                Text(name)
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .kerning(-1.5)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 18.5)
                            } // Button
                            .navigationDestination(isPresented: $isTapped[index]){
                                buttonViews[index]
                            }
                            
                            Spacer()
                            
                        } // HStack
                        
                        Divider().foregroundColor(Color.settingDivider)
                        
                    } // VStack

                } // ForEach
                
                Spacer()
                
            } // VStack
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .modifier(SettingBackButton(title: "운영진 설정", onDismiss: { dismiss() }, showTrailingItem: false))
            
        }
    }

#Preview {
    ManagerSetting()
}
