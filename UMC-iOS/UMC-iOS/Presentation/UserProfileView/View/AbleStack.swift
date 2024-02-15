//  AbleStack.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI

struct AbleStack: View {
    var profileImage = "profileImage"
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    var part = "Figma"
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .frame(width: 78, height: 32)
                .shadow(radius: 5)
            
            HStack(spacing:6){
                Image(part)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                
                Image(part)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
            }
        }
    }
}

#Preview {
    AbleStack()
}

