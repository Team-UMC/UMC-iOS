//
//  SelectPartAndGeneration.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI

struct SelectPartAndGeneration:View {
    @StateObject private var viewModel = JoinViewModel()
    @State private var isClicked = false
    @Binding var userData: UserData
    let generations = ["1기", "2기", "3기", "4기", "5기", "6기"]
    let parts = ["PM", "Design", "Spring", "Node", "Web", "iOS", "Android"]
    
    var body: some View {
        ZStack {
            Image("signup_background")
                .resizable()
            VStack{
                Spacer().frame(height: 140)
                
                Text("기수 및 파트를 선택해주세요")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .semibold))
                
                Text("여러 기수에 참여한 경우, 모든 기수와 파트를 추가해주세요!")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .light))
                
                Spacer().frame(height: 16)
                
                ForEach($viewModel.selections.indices, id: \.self) { index in
                    JoinGenerationPartPickers(selection: $viewModel.selections[index],
                                              generations: generations,
                                              parts: parts,
                                              removeAction: { viewModel.removeSelection(at: index) })
                    .zIndex(Double(viewModel.selections.count - index)) // zIndex 역순 적용
                    .padding(5)
                }
                
                HStack{
                    Button(action: viewModel.addSelection) {
                        HStack {
                            Text("기수 추가")
                            Image(systemName: "plus.circle.fill")
                        }
                        .foregroundStyle(.black)
                        .frame(width: 218, height: 34)
                        .background(.white)
                        .cornerRadius(20)
                    }
                    Spacer().frame(width: 35)
                    
                }
                
                Spacer()
                
                if viewModel.isAtLeastOneSelected {
                    HStack {
                        Spacer()
                        Button {
                            userData.partSemesters = viewModel.selections
                            print(userData)
                            isClicked.toggle()
                        } label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                        .navigationDestination(isPresented: $isClicked) {
                            JoinAgreement(userData: $userData)
                        }
                        Spacer().frame(width: 10)
                    }
                }
                Spacer().frame(height: 137)
            }
        }
        .ignoresSafeArea()
    }
}
