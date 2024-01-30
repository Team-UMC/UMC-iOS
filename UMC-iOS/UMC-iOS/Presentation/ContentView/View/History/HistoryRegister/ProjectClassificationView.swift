//
//  ProjectClassificationView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/30.
//

import SwiftUI

struct ProjectClassificationView: View {
    private var projectTypeDisabledButton: [String] = ["iOSDisabledButtonImage",
                                                       "webDisabledButtonImage",
                                                       "androidDisabledButtonImage"]
    
    private var projectTypeAbledButton: [String] = ["iOSAbledButtonImage",
                                                    "webAbledButtonImage",
                                                    "androidAbledButtonImage"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) { // 분류
                Text("분류")
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .kerning(-1)
                    .foregroundColor(Color.buttonDisabled)
                
                Spacer()
            } // VStack (분류)
            .padding(.horizontal, 6.5)
            .padding(.vertical, 8)
            
            HStack(spacing: 9) {
                ForEach(0..<3) { index in
                    Button {
                        print(projectTypeDisabledButton[index] + "Tapped")
                    } label: {
                        Image(projectTypeAbledButton[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 32)
                    }
                }
                
                Spacer()
                
            } // HStack
            .padding(.vertical, 8)
            
                
        } // VStack
        .padding(.horizontal, 16.5)
    }
}

#Preview {
    ProjectClassificationView()
}
