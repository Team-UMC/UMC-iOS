//
//  HistoryRegisterView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/30.
//

import SwiftUI

struct HistoryRegisterView: View {
    var body: some View {
        VStack(spacing: 0) {
            HistoryRegisterNavigationBarView()
                .padding(.top, 8)
            
            ProjectClassificationView()
                .padding(.top, 16)
            
            Divider().background(Color.grayDivider).padding(.horizontal, 16.5)
            
            ProjectCardinalNumberView()
            
            Divider().background(Color.grayDivider).padding(.horizontal, 16.5)
            
            ProjectIconRegisterView()
            
            Divider().background(Color.grayDivider).padding(.horizontal, 16.5)
            
            ProjectHashtagRegisterView()
            
            Divider().background(Color.grayDivider).padding(.horizontal, 16.5)
            
            ProjectNameRegisterView()
            
            Divider().background(Color.grayDivider).padding(.horizontal, 16.5)
            
            ProjectInformationRegisterView()
            
            Spacer()
            
        } // VStack
    }
}

#Preview {
    HistoryRegisterView()
}
