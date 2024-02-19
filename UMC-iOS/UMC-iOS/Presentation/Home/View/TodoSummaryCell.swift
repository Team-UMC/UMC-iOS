//
//  TodoSummaryCell.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/19/24.
//

import SwiftUI

struct TodoSummaryCell: View {
    @Binding var isClicked: Bool
    let todoInfo: TodoListResponse.TodoListInfo
    var body: some View {
        Button {
            print("TDLPlusButton Clicked")
            isClicked.toggle()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: 122, height: 134)
                    .foregroundColor(Color.main3)
                    .cornerRadius(20)
                    .padding(.leading, 18)
                VStack {
                    VStack(spacing: 5) { // ( )님의 투두를 기다리는 중이에요
                        
                        // 이모티콘
                        Text("🍨")
                            .font(.system(size: 30))
                        
                        // contents
                        Text("\(todoInfo.title)")
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                            .fontWeight(.semibold)
                            .frame(width: 122)
                        
                        // time
                        HStack(spacing: 5) {
                            Text("🕒")
                            Text("\(String.convertToTime(todoInfo.deadline) ?? "미정")")
                        }
                        .font(.system(size: 10))
                        
                    } // VStack
                    .font(.system(size: 14))
                    .kerning(-1.05)
                    .padding(.leading, 18)
                    .foregroundStyle(Color.white)
                }
            }
        } // Button
        .padding(.bottom, 8)
//        .navigationDestination(isPresented: $isClicked) {
//            ToDoListUI()
//                .navigationBarBackButtonHidden()
////                .navigationTitle("To-Do List")
////                .toolbar {
////                    ToolbarItem(placement: .topBarTrailing) {
////                        Button {
////                            print("완료 버튼 클릭")
////                        } label: {
////                            Text("완료")
////                        }
////                    }
////                }
//        }
    }
}

