//
//  ManagerInfomation.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct ManagerInfomation: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var nameAndNickname: String = ""
    
    var body: some View {
        ZStack {
            
            Color.textfieldBack.ignoresSafeArea()
            
            VStack(spacing: 12) {
                
                // Search Bar
                ManagerInfoSearchBar(nameAndNickname: $nameAndNickname)
                
                ManagerInfoSelect()
                
                Spacer()
                
            } // VStack
            .padding(16)
            
        } // ZStack
        .modifier(SettingBackButton(title: "챌린저 정보 변경", onDismiss: { dismiss() }, showTrailingItem: true))
    }
}

#Preview {
    ManagerInfomation()
}
