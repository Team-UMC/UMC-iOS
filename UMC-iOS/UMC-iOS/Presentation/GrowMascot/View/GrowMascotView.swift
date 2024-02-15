//
//  GrowMascotView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct GrowMascotView: View {
    var body: some View {
        ZStack {
            
            // 배경
            Color.gray.ignoresSafeArea(.all)
            
            // 지구 이미지, 마스코트
            VStack(spacing: 0) {
                
                Spacer()
                
                ZStack() {
                    
                    Image("mascotEarthImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 342, height: 342)
                        .padding(.bottom, -170)
                    
                    MascotImageView(mascotImageName: "mascotULevel1Image")
                        .offset(y: -80)
                    
                } // ZStack
                
            } // HStack
            
            
            VStack(spacing: 61) {
                
                
                HStack(spacing: 0) {
                    
                    UniversityExpView()
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        
                        UniversityRankButtonView()
                        MyContributionButtonView()
                        
                    } // HStack
                    
                } // HStack
                
                // 마스코트 먹이
                VStack(spacing: 12) {
                    
                    MascotFoodView(exp: 1, foodInfo: "은하수를 살짝 얹은 커스터드 푸딩")
                    MascotFoodView(exp: 5, foodInfo: "별빛 스프링클이 가득한 블랙홀 도넛")
                    MascotFoodView(exp: 10, foodInfo: "태양이 물든 선샤인 샤베트 아이스크림 ")
                    MascotFoodView(exp: 30, foodInfo: "찬란한 별들이 쏙쏙 박힌 우주맛 롤케이크")
                    
                } // VStack
                
                Spacer()
                
            } // VStack
            .padding(.vertical, 20)
            .padding(.horizontal, 22.5)
            
        } // ZStack
    }
}

#Preview {
    GrowMascotView()
}
