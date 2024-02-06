//
//  TILCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct TILCell: View {
    @State private var isCompleted = false
    @State private var showToDoEditSheet = false
    @State var ToDoTitle: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("#F0F4FF"))
                .frame(width: 341, height: 68)
                .cornerRadius(12)
                
            HStack {
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 34, height: 34)
                    .padding(EdgeInsets(top: 18, leading: 20, bottom: 18, trailing: 0))
                    .overlay(
                        Text("😀")
                            .padding(EdgeInsets(top: 18, leading: 20, bottom: 18, trailing: 0))
                    )
                
                
                VStack {
                    HStack {
                        Text("피그마 3주차 강의 듣기")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    HStack {
                        
                        Text("오전 11:30")
                            .foregroundColor(.black)
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: -6, leading: 0, bottom: -1, trailing: 0))
                        
                        Spacer()
                    }
                }
                
                Button(action: {
                    print("더보기를 눌렀습니다")
                    
                    
                }) {
                    Image("MoreButtondarken")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 20))
                }
                .sheet(isPresented: $showToDoEditSheet) {
//                    ToDoEditFirstActionSheet()
                    
                }
                
                Spacer()
            }
            .padding()
        }
        
    }
}

#Preview {
    TILCell(ToDoTitle: "dskflf")
}

