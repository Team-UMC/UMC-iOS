//  AbleStack.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

// AbleStack.swift

import SwiftUI

struct AbleStack: View {
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    var member = Member()

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .frame(width: 78, height: 32)
                .shadow(radius: 5)
            
            HStack(spacing: 6) {
                if let firstSemesterPart = member.semesterParts?.first {
                    Image(firstSemesterPart.part.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                    
                    if member.semesterParts?.count ?? 0 > 1, let secondSemesterPart = member.semesterParts?[1] {
                        Image(secondSemesterPart.part.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 24, height: 24)
                    }
                }
                
                // member.semesterParts?.first?.part.rawValue를 사용하여 이미지 이름을 가져옴
                Image(member.semesterParts?.first?.part.rawValue ?? "default")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
            }
        }
    }
}

