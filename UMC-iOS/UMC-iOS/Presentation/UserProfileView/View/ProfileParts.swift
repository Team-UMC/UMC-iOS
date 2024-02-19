//  AbleStack.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.


import SwiftUI

struct ProfileParts: View {
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    let memberParts: [MemberResponse.SemesterParts]
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .frame(width: CGFloat(39 * memberParts.count), height: 32)
                .shadow(radius: 5)
            
            HStack(spacing:6){
                HStack(spacing: 6) {
                    ForEach(memberParts.indices, id: \.self) { index in
                        Image(memberParts[index].part)
                    }
                }
            }
        }
    }
}
//// 예시에서의 미리보기에서 사용
//#Preview {
//    AbleStack(member: Member())  // 실제 Member 객체와 함께 semesterParts를 전달해 주세요
//}

