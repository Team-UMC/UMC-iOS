//
//  SelectParts.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/11/24.
//

import SwiftUI

struct SelectParts:View {
    @ObservedObject private var viewModel = JoinViewModel()
    @State var parts: [String] = ["PM","Design","Spring","Node","Web","iOS","Android"]
    
    var body: some View {
        ZStack{
            Image("signup_background")
                .resizable()
            
            VStack{
                Spacer().frame(height: 140)
                
                VStack{
                    Text("파트를 선택해주세요")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    Text("여러 기수에 참여한 경우 기수를 모두 선택해주세요!")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .font(.subheadline)
                    Spacer().frame(height: 16)
                    
                    HStack(spacing: 8){
                        ForEach(parts.prefix((parts.count/2)+1), id: \.self) { title in
                            borderCustomButton(title: title){
                                viewModel.handleButtonSelection(title, selected: &viewModel.selectedParts)
                            }
                        }
                        
                    }
                    
                    HStack(spacing: 8){
                        ForEach(parts.suffix((parts.count/2)), id: \.self) { title in
                            borderCustomButton(title: title){
                                viewModel.handleButtonSelection(title, selected: &viewModel.selectedParts)
                            }
                        }
                        
                    }
                }
                .padding()
                
                Spacer().frame(height: 320)
                
                if (!viewModel.selectedParts.isEmpty){
                    JoinNavigationButton(destination: JoinAgreement())
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}
