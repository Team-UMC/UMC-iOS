//
//  mascotFeedPopupView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct mascotFeedPopupView: View {
    
    @ObservedObject var universityNetwork = UniversityNetwork()
    var pointType: PointType
    
    @Binding var shouldShowFeedPopup: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 말랑이에게 밥을 주시겠어요?
            Text("말랑이에게 밥을 주시겠어요?")
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .kerning(-1)
                .foregroundColor(.black)
            
            // Exp 차감 문구
            HStack(spacing: 0) {
                
                Text("\(pointType.point) EXP")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.historyPurple)
                Text("가 차감됩니다.")
                
            } // HStack
            .font(.system(size: 14))
            .kerning(-1)
            .padding(.top, 8)
            
            HStack(spacing: 40) {
                
                // 확인 버튼
                Button {
                    print("줄래요 Button Tapped")
                    Task {
                        await universityNetwork.fetchFeedUniversityMascot(request: UniversityRequest.FeedUniversityMascot(pointType: pointType))
                    }
                    shouldShowFeedPopup.toggle()
                } label: {
                    Text("줄래요")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.historyPurple)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color("#F0F4FF"))
                        // .background(Color.white)
                        .cornerRadius(12)
                        
                } // Buttongh
                
                // 취소 버튼
                Button {
                    print("취소할래요 Button Tapped")
                    self.shouldShowFeedPopup = false
                } label: {
                    Text("취소할래요")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color("#F0F4FF"))
                        // .background(Color.white)
                        .cornerRadius(12)
                        
                } // Button
                
            } // HStack
            .padding(.top, 16)
            
        } // VStack
        .padding(.vertical, 24)
        .padding(.horizontal, 56)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.25), radius: 5)
    }
}

