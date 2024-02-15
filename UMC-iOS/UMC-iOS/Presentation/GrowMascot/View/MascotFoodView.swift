//
//  MascotFoodView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct MascotFoodView: View {
    
    var foodImageName: String = ""
    var exp: Int = 0
    var foodInfo: String = ""
    var mascot: String = ""
    
    @Binding var shouldShowFeedPopup: Bool
    
    var body: some View {
        
        Button {
            print("\(foodInfo) Button Tapped. (\(exp) exp)")
            self.shouldShowFeedPopup = true
        } label: {
            
            HStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    
                    // 먹이 이미지와 exp
                    VStack(spacing: 0) {
                        
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundColor(.white)
                        
                        Text("\(exp)" + " EXP")
                            .font(.system(size: 8))
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 8)
                            .background(.white)
                            .cornerRadius(12)
                            .padding(.top, -6)
                        
                    } // VStack
                    
                    // 먹이 설명
                    Text("\(foodInfo)")
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .kerning(-0.24)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.trailing, 12)
                        .padding(.leading, 20)
                        .background(Color.white.opacity(0.25))
                        .cornerRadius(16)
                        .padding(.leading, -12)
                        .padding(.top, -6)
                        .shadow(color: .white, radius: 18)
                    
                } // HStack
                
                Spacer()
                
            } // HStack
            
        } // Button
        
    }
}
