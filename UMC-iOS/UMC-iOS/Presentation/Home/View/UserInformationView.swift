//
//  UserInformationView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct UserInformationView: View {
    var body: some View {
        HStack {
            Image("univPictureEx") // 학교 사진
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                .background(Circle().foregroundColor(Color.white))
                .padding(.leading, 16)
            
            Text("가톨릭대학교") // 학교 이름
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold))
                .kerning(-1.07)
            
            Spacer()
            
            HStack(spacing: 0) { // ( )님 반가워요!
                Text("원")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                    // .kerning(-1.032)
                    
                Text("님 반가워요!")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    // .kerning(-1.032)
            } // HStack
            .padding(.trailing, 16)
        }
    }
}

