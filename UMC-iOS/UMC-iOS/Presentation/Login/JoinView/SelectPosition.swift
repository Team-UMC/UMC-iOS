//
//  SelectPosition.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/12/24.
//

import SwiftUI

struct SelectPosition: View {
    @ObservedObject private var viewModel = JoinViewModel()
    @Binding var userData: UserData
    @State private var position:[String] = ["회장", "부회장", "운영국장", "PM 파트장", "Design 파트장", "Spring 파트장", "Node 파트장", "Web 파트장", "iOS 파트장", "Android 파트장"]
    @State private var newPosition = "" // 사용자가 입력할 새 직책

    var body: some View {
        ZStack{
            Image("signup_background")
                .resizable()
            
            VStack() {
                Spacer().frame(height: 140)
                
                VStack{
                    Text("직책을 선택해주세요")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    Text("현재 기수를 기준으로 본인이 맡은 직책을 모두 선택해주세요")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .font(.subheadline)
                    
                    Spacer().frame(height: 32)
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 3.5){
                            Image(systemName: "building.columns.fill")
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.white)
                                .background(Circle().fill(Color.black))
                            Text("학교")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .frame(width: 68, height: 32)
                        .background(.white)
                        .cornerRadius(32)
                        
                        HStack(spacing: 8){
                            ForEach(position[0...3], id: \.self) { title in
                                borderCustomButton(title: title, fontSize: 12){
                                    viewModel.handleButtonSelection(title, selected: &viewModel.selectedPosition_inUnivs)
                                }
                            }
                        }
                        HStack(spacing: 8){
                            ForEach(position[4...6], id: \.self) { title in
                                borderCustomButton(title: title, fontSize: 12){
                                    viewModel.handleButtonSelection(title, selected: &viewModel.selectedPosition_inUnivs)
                                }
                            }
                        }
                        HStack(spacing: 8){
                            ForEach(position[7...9], id: \.self) { title in
                                borderCustomButton(title: title, fontSize: 12){
                                    viewModel.handleButtonSelection(title, selected: &viewModel.selectedPosition_inUnivs)
                                }
                            }
                        }
                        HStack(spacing: 8){
                            ForEach(position[10...], id: \.self) { title in
                                borderCustomButton(title: title, fontSize: 12){
                                    viewModel.handleButtonSelection(title, selected: &viewModel.selectedPosition_inUnivs)
                                }
                            }
                        }
                                        
                        ZStack{
                            // 직책 추가 텍스트 필드
                            TextField("", text: $newPosition, prompt: Text("직책추가")
                                .foregroundStyle(.white)
                                .font(.system(size: 12))
                            )
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .background(.clear)
                            .padding()
                            .offset(x:8)
                            // 직책 추가 버튼
                            Button(action: {
                                guard !newPosition.isEmpty else { return }
                                position.append(newPosition)
                                newPosition = "" // 입력 필드 초기화
                            }){
                                HStack{
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundStyle(.white)
                                    Spacer().frame(width:55)
                                }
                            }
                            .padding(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 1)
                                
                            )
                            .offset(x:-140)
                        }
                        .padding(.top, -7)
                    }
                    
                    .padding()
                    
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 3.5){
                            Image(systemName: "globe")
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.white)
                                .background(Circle().fill(Color.black))
                            Text("중앙")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .frame(width: 68, height: 32)
                        .background(.white)
                        .cornerRadius(32)
                        
                        HStack(spacing: 8){
                            ForEach(position[0...3], id: \.self) { title in
                                borderCustomButton(title: title, fontSize: 12){
                                    viewModel.handleButtonSelection(title, selected: &viewModel.selectedPosition_central)
                                }
                            }
                        }
                        HStack(spacing: 8){
                            ForEach(position[4...6], id: \.self) { title in
                                borderCustomButton(title: title, fontSize: 12){
                                    viewModel.handleButtonSelection(title, selected: &viewModel.selectedPosition_central)
                                }
                            }
                        }
                        HStack(spacing: 8){
                            ForEach(position[7...9], id: \.self) { title in
                                borderCustomButton(title: title, fontSize: 12){
                                    viewModel.handleButtonSelection(title, selected: &viewModel.selectedPosition_central)
                                }
                            }
                        }
                        HStack(spacing: 8){
                            ForEach(position[10...], id: \.self) { title in
                                borderCustomButton(title: title, fontSize: 12){
                                    viewModel.handleButtonSelection(title, selected: &viewModel.selectedPosition_central)
                                }
                            }
                        }
                                        
                        ZStack{
                            // 직책 추가 텍스트 필드
                            TextField("", text: $newPosition, prompt: Text("직책추가")
                                .foregroundStyle(.white)
                                .font(.system(size: 12))
                            )
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .background(.clear)
                            .padding()
                            .offset(x:8)
                            // 직책 추가 버튼
                            Button(action: {
                                guard !newPosition.isEmpty else { return }
                                position.append(newPosition)
                                newPosition = "" // 입력 필드 초기화
                            }){
                                HStack{
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundStyle(.white)
                                    Spacer().frame(width:55)
                                }
                            }
                            .padding(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 1)
                                
                            )
                            .offset(x:-140)
                        }
                        .padding(.top, -7)
                    }
                    .padding()

                    if (!viewModel.selectedPosition_central.isEmpty || !viewModel.selectedPosition_inUnivs.isEmpty)
                    {
                        JoinNavigationButton(destination: SelectUniv(userData: $userData))
                    }
                    Spacer().frame(width: 137)
                }
            }
        }
        .ignoresSafeArea()
    }
}
