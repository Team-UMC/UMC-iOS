//
//  GrowMascotView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI
import PopupView

struct GrowMascotView: View {
    
    @State var shouldShowFeedPopup: Bool = false
    
    var body: some View {
        ZStack {
            
            // 배경
            Image("growMascotViewBackgroundImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .offset(y: -13)
            
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
                
            } // VStack
            
            
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
                    
                    MascotFoodView(foodImageName: "puddingImage",
                                   exp: 1,
                                   foodInfo: "은하수를 살짝 얹은 커스터드 푸딩",
                                   shouldShowFeedPopup: $shouldShowFeedPopup)
                    
                    MascotFoodView(foodImageName: "puddingImage",
                                   exp: 5,
                                   foodInfo: "별빛 스프링클이 가득한 블랙홀 도넛",
                                   shouldShowFeedPopup: $shouldShowFeedPopup)
                    
                    MascotFoodView(foodImageName: "puddingImage",
                                   exp: 10,
                                   foodInfo: "태양이 물든 선샤인 샤베트 아이스크림",
                                   shouldShowFeedPopup: $shouldShowFeedPopup)
                    
                    MascotFoodView(foodImageName: "puddingImage",
                                   exp: 30,
                                   foodInfo: "찬란한 별들이 쏙쏙 박힌 우주맛 롤케이크",
                                   shouldShowFeedPopup: $shouldShowFeedPopup)
                    
                } // VStack
                
                Spacer()
                
            } // VStack
            .padding(.top, 20)
            .padding(.horizontal, 22.5)
            
            Color(.black)
                .ignoresSafeArea(.all)
                .opacity(self.shouldShowFeedPopup ? 0.3 : 0)
            
        } // ZStack
        .popup(isPresented: $shouldShowFeedPopup, view: {self.createFeedPopup()},
               customize: {
            $0
                .type(.default)
                .position(.center)
                .animation(.bouncy)
                .closeOnTap(false)
                .closeOnTapOutside(true)
        })
        
    }
    
    func createFeedPopup() -> some View {
        
        return mascotFeedPopupView(exp: 30, shouldShowFeedPopup: $shouldShowFeedPopup)
        
    }
}

#Preview {
    GrowMascotView()
}
