//
//  ProjectNameRegisterView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/30.
//

import SwiftUI

struct ProjectNameRegisterView: View {
    
    @State private var projectName: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField("앱 이름",
                          text: $projectName,
                          prompt: Text("앱 이름")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .kerning(-1)
                    .foregroundColor(Color.buttonDisabled))
                .padding(.horizontal, 8)
                .padding(.vertical, 6.5)
                
                Spacer()
            } // HStack
            
            
        } // VStack
        .padding(.horizontal, 16.5)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    ProjectNameRegisterView()
}
