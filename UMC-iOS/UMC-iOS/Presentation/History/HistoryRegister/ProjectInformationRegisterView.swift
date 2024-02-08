//
//  ProjectInformationRegisterView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/31.
//

import SwiftUI

struct ProjectInformationRegisterView: View {
    
    @State private var projectInfo: String = ""
    private let placeholder = "앱 설명을 간단하게 적어주세요 (50자 이내)"
    private let maxCharacterCount: Int = 50 // 인포 50글자 제한
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 0) {
            PlaceholderTextEditor(text: $projectInfo, placeholder: placeholder, maxCharacterCount: maxCharacterCount)
                .frame(height: 150)
            
            Text("\(projectInfo.count) / \(maxCharacterCount)")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .kerning(-1)
                .foregroundColor(projectInfo.count >= maxCharacterCount ? Color.red : Color.buttonDisabled)
                .padding(.horizontal, 8)
        }
        .padding(.horizontal, 16.5)
        .padding(.vertical, 8)
    }
    
    
    struct PlaceholderTextEditor: View {
        @Binding var text: String
        let placeholder: String
        let maxCharacterCount: Int

        var body: some View {
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.buttonDisabled)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 7.5)
                }
                TextEditor(text: $text)
                    .onChange(of: text) { newValue in
                        if newValue.count > maxCharacterCount {
                            text = String(newValue.prefix(maxCharacterCount))
                        }
                    }
                    .opacity(text.isEmpty ? 0.25 : 1.0)
                    .padding(.horizontal, 4)
            }
        }
    }
}



#Preview {
    ProjectInformationRegisterView()
}
