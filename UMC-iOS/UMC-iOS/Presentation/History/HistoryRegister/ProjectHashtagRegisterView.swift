//
//  ProjectHashtagRegisterView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/30.
//

import SwiftUI

struct ProjectHashtagRegisterView: View {
    
    @State private var projectHashtags: [String] = ["", "", ""]
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 0) {
                Text("세가지 해시태그를 등록해주세요")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .kerning(-1)
                    .foregroundColor(Color.buttonDisabled)
                    .padding(.vertical, 5.5)
                
                HStack(spacing: 8) {
                    ForEach(0..<3) { index in
                        /*
                        TextField("#",
                                  text: $projectHashtags[index],
                                  prompt: Text("#")
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .kerning(-0.48)
                            .foregroundColor(Color.disabledGray))
                         */
                        
                        Text("#")
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .kerning(-0.48)
                            .foregroundColor(Color.disabledGray)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.hashtagBackground)
                    .cornerRadius(12)
                    
                    Spacer()
                } // HStack (해시태그)
                .padding(.top, 13.5)
                
            } // VStack
            .padding(.horizontal, 8)
            
            Spacer()
            
        } // HStack
        .padding(.horizontal, 16.5)
        .padding(.vertical, 8)
    }
}

#Preview {
    ProjectHashtagRegisterView()
}
/*
 
 TextField("프로젝트 제목을 입력해주세요",
           text: $projectTitle,
           prompt: Text("프로젝트 제목을 입력해주세요").foregroundColor(Color.tdlGray))
     .font(.system(size: 14))
     .kerning(-1.0)
 
 
 */
