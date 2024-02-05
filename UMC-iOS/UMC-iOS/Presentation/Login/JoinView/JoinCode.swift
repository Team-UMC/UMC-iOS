//
//  JoinCode.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/9/24.
//

import SwiftUI

struct JoinCode: View {
    @StateObject private var viewModel = JoinViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("signup_background")
                    .resizable()
                
                VStack {
                    Spacer().frame(height: 140)
                    
                    VStack{
                        Text("초대코드를 입력해주세요")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title)
                        
                        Spacer().frame(height: 16)
                        
                        TextField("", text: $viewModel.inviteCode,
                                  prompt: Text("초대코드를 입력해주세요!")
                            .font(.system(size:18))
                            .foregroundColor(.black.opacity(0.5)
                                            )
                                  
                        )
                        .padding(10)
                        .modifier(JoinTextFieldStyle())
                        //여백 사이즈(초대코드 입력필드와 QR버튼 사이)
                        Spacer().frame(height: 136)
                        
                        VStack {
                            // 버튼에 이미지만 넣기
                            Button(action: {
                                // 버튼이 클릭되었을 때 수행할 동작
                                viewModel.isQRAuthenticated.toggle()
                            }) {
                                Image("QRSample")
                                    .frame(width: 66, height: 66)
                                    .background(.white)
                                    .cornerRadius(12)
                                    .padding(10)
                            }
                            
                            Spacer().frame(height: 4)
                            
                            Text("QR로 인증하기")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                        }
                    }
                    .padding(.top)
                    
                    Spacer().frame(height:150)
                    
                    // 초대코드 또는 QR 인증이 완료되면 보이는 버튼
                    if viewModel.isInviteCodeValid || viewModel.isQRAuthenticated {
                        JoinNavigationButton(destination: SelectUniv())
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    JoinCode()
}

//git checkout feature/#4-joinview
