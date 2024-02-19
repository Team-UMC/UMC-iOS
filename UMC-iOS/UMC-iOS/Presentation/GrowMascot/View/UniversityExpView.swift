//
//  UniversityExpView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct UniversityExpView: View {
    
    @Binding var mascotInfo: UniversityResponse.GetUniversityMascotInfo
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            HStack(spacing: 12) {
                
                // 학교 로고
                Image(mascotInfo.universityName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                
                // 레벨, exp
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("LV.\(mascotInfo.level)")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .kerning(-1.26)
                        .foregroundColor(Color.historyPurple)
                    
                    HStack(spacing: 0) {
                        
                        Text("\(mascotInfo.point)")
                            .fontWeight(.semibold)
                        Text(" / 11000")
                        
                    } // HStack
                    .font(.system(size: 12))
                    .kerning(-0.24)
                    .foregroundColor(Color.tdlGray)
                    
                } // VStack
                .padding(.top, -3)
                    
                
            } // HStack
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(12)
            
        } // HStack
        
    }
}

//#Preview {
//    UniversityExpView()
//}
