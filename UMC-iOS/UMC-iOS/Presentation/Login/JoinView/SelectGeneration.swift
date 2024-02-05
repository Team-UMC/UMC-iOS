//
//  SelectGeneration.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/11/24.
//

import SwiftUI

struct SelectGeneration:View {
    @ObservedObject private var viewModel = JoinViewModel()
    @State var generation: [String] = ["1기","2기","3기","4기","5기","6기"]
    
    
    var body: some View {
        ZStack {
            Image("signup_background")
                .resizable()
            
            VStack {
                Spacer().frame(height: 140)
                
                VStack {
                    Text("기수를 선택해주세요")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Text("여러 기수에 참여한 경우 기수를 모두 선택해주세요!")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .font(.subheadline)
                    
                    Spacer().frame(height: 16)
                    
                    ForEach(0..<2, id: \.self) { row in
                        HStack(spacing: 8) {
                            ForEach(0..<4, id: \.self) { column in
                                let index = row * 4 + column
                                if index < generation.count {
                                    let title = generation[index]
                                    borderCustomButton(title: title) {
                                        viewModel.handleButtonSelection(title, selected: &viewModel.selectedGeneration)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                
                Spacer().frame(height: 320)
                
                if (!viewModel.selectedGeneration.isEmpty){
                    JoinNavigationButton(destination: JoinName())
                    
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SelectGeneration()
}
