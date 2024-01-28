//
//  HotProjectView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/28.
//

import SwiftUI

struct HotProjectView: View {
    var projectHashTag: [String] = ["동물", "정보", "커뮤니티"]
    var umcNumber: [String] = ["umc1st", "umc2nd", "umc3rd", "umc4th", "umc5th"]
    
    var body: some View {
        VStack(spacing: 0) {
            Text("HOT! 프로젝트")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            ZStack { // 프로젝트 아이콘 + 프로젝트 정보
                ZStack { // 프로젝트 아이콘
                    Image(umcNumber[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 138, height: 138)
                    
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 120)
                    
                    Image("hotProjectIconEx")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 104, height: 104)
                        .clipShape(Circle())
                        .background(Circle().foregroundColor(Color.white))
                } // ZStack
                
                VStack(spacing: 0) { // 프로젝트 정보
                    Text("동친")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)


                    Text("동물 정보 커뮤니티")
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .padding(.top, 2)
                    
                    HStack(spacing: 4) {
                        ForEach(0..<projectHashTag.count, id: \.self) { index in
                            Text("#\(projectHashTag[index])")
                                .font(.system(size: 8))
                                .fontWeight(.regular)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.lightGray)
                                .cornerRadius(12.0)
                        }
                    } // HStack
                    .padding(.top, 12)
                    
                } // VStack
                .padding(.horizontal, 32)
                .padding(.vertical, 8)
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(12.0)
                .offset(x: 0, y: 88) // 아이콘 보다 아래로
                
            } // ZStack
            .padding(.top, 22)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    Spacer()
                    
                    ForEach(1..<5) { index in
                        VStack(spacing: 6) {
                            ZStack {
                                Image(umcNumber[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 56, height: 56)
                                
                                Image("hotProjectIconEx")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                                    .background(Circle().foregroundColor(Color.white))
                            } // ZStack
                            
                            Text("동친")
                                .font(.system(size: 12))
                                .fontWeight(.thin)
                                .foregroundColor(.gray)
                        } // VStack
                    } // ForEach
                    Spacer()
                } // HStack
            } // ScrollView
            .padding(.top, 100)
            
        } // VStack
    }
}


#Preview {
    HistoryView()
}
