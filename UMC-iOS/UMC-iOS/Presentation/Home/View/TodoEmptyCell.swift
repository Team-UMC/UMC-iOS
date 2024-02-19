//
//  TodoEmptyCell.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/19/24.
//

import SwiftUI

struct TodoEmptyCell: View {
    @Binding var isClicked: Bool
    let memberNickname: String
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            Button {
                print("TDLPlusButton Clicked")
                isClicked.toggle()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 122, height: 134)
                        .foregroundColor(Color.tdlDisabled)
                        .cornerRadius(20)
                        .padding(.leading, 18)
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.tdlGray)
                            .offset(x: 8, y: 0)
                        VStack { // ( )님의 투두를 기다리는 중이에요
                            HStack(spacing: 0) {
                                Text(memberNickname)
                                    .fontWeight(.semibold) +
                                Text("님의 투두를 기다리는 중이에요..😴")
                            }
                            .frame(width: 122)
                            .padding(5)
                            
                        } // VStack
                        .font(.system(size: 12))
                        .kerning(-1.05)
                        .padding(.leading, 18)
                        .foregroundStyle(Color.black)
                    }
                }
            } // Button
            .padding(.bottom, 8)
//            .navigationDestination(isPresented: $isClicked) {
//                ToDoListUI()
//                    .navigationBarBackButtonHidden()
////                    .navigationTitle("To-Do List")
////                    .toolbar {
////                        ToolbarItem(placement: .topBarTrailing) {
////                            Button {
////                                print("완료 버튼 클릭")
////                            } label: {
////                                Text("완료")
////                            }
////                        }
////                    }
//            }
        } // VStack
    }
}
