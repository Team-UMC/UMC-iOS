//
//  JoinFinalMessage.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI

struct JoinFinalMessage:View {
    @State private var isClickedFinalMessage = false

    var body: some View {
        ZStack{
            Image("signup_background")
                .resizable()
                        
            VStack{
                
                Spacer().frame(height: 140)
                
                VStack{
                    Text("🎉 회원가입이 끝났어요 🥳")
                        .font(.system(size: 30, weight: .semibold))
                        .padding()

                    Text("ㅇㅇ님! UMC 챌린저가 된 것을 축하해요 👏🏻\n\n수많은 별들 중 ㅇㅇ님을 만나게 되어 기쁘답니다!\nUMC에서 가장 빛나는 별로 함께 성장해봐요 🌟\n\n수많은 챌린저가 ㅇㅇ님과 함께할 거예요!\n\n그럼 지금 바로 수많은 챌린저들을 만나러 가볼까요?!\n")
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 30)
                }
                .foregroundStyle(.white)
                Button(action: {
                    isClickedFinalMessage.toggle()
                }) {
                    Text("UMC 어플로 입장하기")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.black)
                    
                }
                .padding(EdgeInsets(top: 12, leading: 22, bottom: 12, trailing: 22))
                .background(.white)
                .cornerRadius(58)
                Spacer()
            }
            //네비게이션 페이지 전환
            .navigationDestination(isPresented: $isClickedFinalMessage){
                HomeView()
            }
            .navigationBarBackButtonHidden()
        }
        .ignoresSafeArea()
    }
}
