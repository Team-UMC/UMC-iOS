//
//  WritingListCellSecond.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/05.
//

import SwiftUI

struct WritingListCellSecond: View {
    @State private var title: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField("제목",
                          text: $title,
                          prompt: Text("제목")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .kerning(-1)
                    .foregroundColor(Color.buttonDisabled))
                .padding(.horizontal, 8)
                .padding(.vertical, 6.5)
                
                Spacer()
            }
            
            
        } 
        .padding(.horizontal, 16.5)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    WritingListCellSecond()
}
