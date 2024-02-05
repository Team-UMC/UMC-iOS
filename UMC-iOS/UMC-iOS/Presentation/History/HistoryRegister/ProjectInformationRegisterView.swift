//
//  ProjectInformationRegisterView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/31.
//

import SwiftUI

struct ProjectInformationRegisterView: View {
    
    @State private var projectInfo: String = ""
    
    var body: some View {
        
        VStack(alignment:.trailing, spacing:0) {
            
            HStack(spacing: 0) {
                TextField("앱 이름",
                          text: $projectInfo,
                          prompt: Text("앱 설명을 간단하게 적어주세요 (50자 이내)")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .kerning(-1)
                    .foregroundColor(Color.buttonDisabled)
                )
                .frame(width: .infinity, height: 150, alignment: .topLeading)
                .padding(.horizontal, 8)
                .padding(.vertical, 7.5)
                
            } // HStack
            
            Text("\(projectInfo.count) / 50")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .kerning(-1)
                .foregroundColor(Color.buttonDisabled)
                .padding(.horizontal, 8)
            
        } // VStack
        .padding(.horizontal, 16.5)
        .padding(.vertical, 8)
    }
}

#Preview {
    ProjectInformationRegisterView()
}
