//
//  JoinAgreement.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/11/24.
//

import SwiftUI

struct JoinAgreement:View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @ObservedObject private var viewModel = JoinViewModel()
    @State private var isClicked = false
    @Binding var userData: UserData
    
    var body: some View {
        ZStack{
            Image("signup_background")
                .resizable()
            
            VStack{
                Spacer().frame(height: 140)
                
                VStack{
                    Text("개인정보 동의를 해주세요")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Spacer().frame(height: 32)
                    
                    HStack(){
                        JoinAgreCircleCheckButton(circleCheckButton_isChecked: $viewModel.isAllAgreed, title: "약관 전체동의"){
                            viewModel.toggleAllAgreements()
                            print(viewModel.isAllAgreed)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(.white)
                        .padding(10)
                    
                    HStack {
                        JoinAgreCircleCheckButton(circleCheckButton_isChecked: $viewModel.isTermsAgreed, title: "이용약관 동의 (필수)"){
                            viewModel.toggleTermsAgreement()
                        }
                        Spacer()
                        Button(action: {}, label: {
                            HStack{
                                Text("약관보기")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white)
                                
                                Spacer().frame(width: 2)
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.white)
                                    .imageScale(.small)
                            }
                        })
                        
                    }
                    .padding(.horizontal, 10)
                    

                    HStack {
                        JoinAgreCircleCheckButton(circleCheckButton_isChecked: $viewModel.isPrivacyAgreed,title: "개인정보 수집 및 이용동의 (필수)"){
                            viewModel.togglePrivacyAgreement()
                        }
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack{
                                Text("약관보기")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white)
                                
                                Spacer().frame(width: 2)
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.white)
                                    .imageScale(.small)
                            }
                        })
                    }
                    .padding(.horizontal, 10)
                }
                .padding([.top, .horizontal])
                
                Spacer().frame(height: 273)
                
                if (viewModel.isAllAgreed) {
                    HStack {
                        Spacer()
                        Button {
                            print(userData)
                            Task {
                                // 수정 필요
                                await viewModel.fetchSignUpMember(signUpMemberInfo: MemberRequest.SignUpMember(name: userData.name!, nickname: userData.nickname!, semesterParts: [MemberRequest.SemesterPart(part: "SPRING", semester: "FIFTH")], universityName: userData.university!, campusPositions: [], centerPositions: []))
                            }
                            isClicked.toggle()
                        } label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                        .navigationDestination(isPresented: $isClicked) {
                            HomeView()
                                .navigationBarBackButtonHidden()
                        }
                        Spacer().frame(width: 10)
                    }
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}
