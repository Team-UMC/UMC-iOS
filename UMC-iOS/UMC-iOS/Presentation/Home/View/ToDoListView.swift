//
//  ToDoListView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

struct ToDoListView: View {
    var TDLList : [String] = ["1", "2", "3"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("To - Do List")
                    .font(.system(size: 16, weight: .semibold))
                    .kerning(-1.07)
                    .foregroundStyle(Color.main2)
                    .padding(.leading, 18)
                
                Spacer()
            } // HStack
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<3) { index in
                        ZStack {
                            Rectangle()
                                .frame(width: 122, height: 134)
                                .foregroundColor(Color.tdlDisabled)
                                .cornerRadius(20)
                                .padding(.leading, 18)
                            
                            VStack(spacing: 0) {
                                Button {
                                    print("TDLPlusButton Clicked")
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(Color.tdlGray)
                                        .offset(x: 8, y: 0)
                                } // Button
                                .padding(.bottom, 8)
                                
                                VStack { // ( )님의 투두를 기다리는 중이에요
                                    HStack(spacing: 0) {
                                        Text("원")
                                            .fontWeight(.semibold)
                                        Text("님의 투두를")
                                    }
                                    Text("기다리는 중이에요..😴")
                                } // VStack
                                .font(.system(size: 12))
                                .kerning(-1.05)
                                .padding(.leading, 18)
                            } // VStack
                        } // ZStack
                    } // ForEach
                } // HStack
                .padding(.trailing, 18)
            } // ScrollView
            .shadow(color: Color.gray.opacity(0.7), radius: 3, x: 0, y: 2)
            .padding(.top, 8)
        }
    }
}
