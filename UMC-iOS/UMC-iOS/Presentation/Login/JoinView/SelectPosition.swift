//
//  SelectPosition.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/12/24.
//

import SwiftUI

struct SelectPosition: View {
    @ObservedObject private var viewModel = JoinViewModel()
    @State private var position_inUniv:[String] = ["회장", "부회장", "운영국장", "PM 파트장", "Design 파트장", "Spring 파트장", "Node 파트장", "Web 파트장", "iOS 파트장", "Android 파트장"]
    
    var body: some View {
        ZStack{
            Image("signup_background")
                .resizable()
            
            VStack {
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
                    
                    borderCustomButton(title: "학교", action: {})
                    
                    HStack(spacing: 8){
                        ForEach(position_inUniv[0...3], id: \.self) { title in
                            borderCustomButton(title: title, fontSize: 12){
                                viewModel.handleButtonSelection(title, selected: &viewModel.selectedGeneration)
                            }
                        }
                    }
                    HStack(spacing: 8){
                        ForEach(position_inUniv[4...6], id: \.self) { title in
                            borderCustomButton(title: title, fontSize: 12){
                                viewModel.handleButtonSelection(title, selected: &viewModel.selectedGeneration)
                            }
                        }
                    }
                    HStack(spacing: 8){
                        ForEach(position_inUniv[7...], id: \.self) { title in
                            borderCustomButton(title: title, fontSize: 12){
                                viewModel.handleButtonSelection(title, selected: &viewModel.selectedGeneration)
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

