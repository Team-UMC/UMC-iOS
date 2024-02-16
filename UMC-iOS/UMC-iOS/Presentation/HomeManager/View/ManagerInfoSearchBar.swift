//
//  ManagerInfoSearchBar.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct ManagerInfoSearchBar: View {
    
    @Binding var nameAndNickname: String
    
    var body: some View {
        // Search Bar
        HStack(spacing: 10) {
            
            Image("searchImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
            
            TextField("닉네임/이름",
                      text: $nameAndNickname,
                      prompt: Text("닉네임/이름")
                .font(.system(size: 14))
                .fontWeight(.regular)
                .kerning(-1)
                .foregroundColor(Color.buttonDisabled))
            
            Button {
                self.nameAndNickname = ""
            } label: {
                Image("xFillButtonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 13, height: 13)
            } // Button
            
        } // HStack (SearchBar)
        .padding(8)
        .background(.white)
        .cornerRadius(12)
    }
}
