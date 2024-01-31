//
//  ToDoListCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/30.
//

import SwiftUI

struct ToDoListCell: View {
    @State private var isCompleted = false
    @State private var showToDoEditSheet = false
    @State var ToDoTitle: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isCompleted ? Color("#F0F4FF") : Color("#F6F6F6"))
                .frame(width: 341, height: 68)
                .cornerRadius(12)
            
            HStack {
                Button(action: {
                    isCompleted.toggle()
                }) {
                    Image(isCompleted ? "PlanedIcon" : "PlanIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .padding(EdgeInsets(top: 18, leading: 28, bottom: 18, trailing: 8))
                }
                ZStack{
                    Rectangle()
                        .fill(.white)
                        .frame(width: 34, height: 34)
                        .padding(EdgeInsets(top: 18, leading: -4, bottom: 18, trailing: 0))
                Text("🌕")
                        .padding(EdgeInsets(top: 18, leading: -4, bottom: 18, trailing: 0))
                    
                }
                VStack {
                    HStack {
                        Text("피그마 3주차 강의 듣기")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    HStack {
                        Image("ClockIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 10.5, height: 10.5)
                            .padding(EdgeInsets(top: -6, leading: 0, bottom: -1, trailing: 1.75))
                        
                        Text("오전 11:30")
                            .foregroundColor(.black)
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: -6, leading: -4, bottom: -1, trailing: 0))
                        
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
                    ToDoEditFirstActionSheet()
                       
                }
                
                Spacer()
            }
            .padding()
        }

    }
}

struct ToDoListCell_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListCell(ToDoTitle: "")

    }
}


