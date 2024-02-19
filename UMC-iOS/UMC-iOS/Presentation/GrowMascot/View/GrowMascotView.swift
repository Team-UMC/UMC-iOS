//
//  GrowMascotView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI
import PopupView

struct GrowMascotView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var isTapped1: Bool = false
    @State var isTapped2: Bool = false
    
    @State var shouldShowFeedPopup: Bool = false
    @State var selectedPointType: PointType = .PUDDING
    
    let pointTypes: [PointType] = [.PUDDING, .DOUGHNUT, .ICE_CREAM, .ROLL_CAKE]
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea(.all)
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
                        .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 8)
                    
                } // ZStack
                
            } // VStack
            
            
            VStack(spacing: 61) {
                
                Spacer().frame(height: 30)
                
                HStack(spacing: 0) {
                    
                    UniversityExpView()
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        
                        UniversityRankButtonView(isTapped1: $isTapped1)
                        MyContributionButtonView(isTapped2: $isTapped2)
                        
                    } // HStack
                    
                } // HStack
                
                // 마스코트 먹이
                VStack(spacing: 12) {
                    
                    ForEach(pointTypes.indices, id: \.self) { index in
                        let pointType = pointTypes[index]
                        MascotFoodView(pointType: pointType, selectedPointType: $selectedPointType, shouldShowFeedPopup: $shouldShowFeedPopup)
                        
                    }
//                    
//                    MascotFoodView(foodImageName: "puddingImage",
//                                   exp: 1,
//                                   foodInfo: "은하수를 살짝 얹은 커스터드 푸딩",
//                                   shouldShowFeedPopup: $shouldShowFeedPopup)
//                    
//                    MascotFoodView(foodImageName: "donutImage",
//                                   exp: 5,
//                                   foodInfo: "별빛 스프링클이 가득한 블랙홀 도넛",
//                                   shouldShowFeedPopup: $shouldShowFeedPopup)
//                    
//                    MascotFoodView(foodImageName: "icecreamImage",
//                                   exp: 10,
//                                   foodInfo: "태양이 물든 선샤인 샤베트 아이스크림",
//                                   shouldShowFeedPopup: $shouldShowFeedPopup)
//                    
//                    MascotFoodView(foodImageName: "rollcakeImage",
//                                   exp: 30,
//                                   foodInfo: "찬란한 별들이 쏙쏙 박힌 우주맛 롤케이크",
//                                   shouldShowFeedPopup: $shouldShowFeedPopup)
                    
                } // VStack
                
                Spacer()
                
            } // VStack
            .padding(.top, 16)
            .padding(.horizontal, 22.5)
            .modifier(SettingBackButtonMascot(title: "마스코트 키우기", onDismiss: { dismiss() }, showTrailingItem: false))
            
//            Color(.black)
//                .ignoresSafeArea(.all)
//                .opacity(self.shouldShowFeedPopup ? 0.3 : 0)
            
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
        
        return mascotFeedPopupView(pointType: selectedPointType, shouldShowFeedPopup: $shouldShowFeedPopup)
        
    }
}

#Preview {
    GrowMascotView()
}
