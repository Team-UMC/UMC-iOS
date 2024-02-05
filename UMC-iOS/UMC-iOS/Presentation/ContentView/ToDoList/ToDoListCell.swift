//
//  ToDoListCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/30.
//

import SwiftUI

struct ToDoListCell: View {
    @StateObject private var viewModel: ToDoListCellViewModel
    @State private var showToDoEditSheet = false
    
    init(viewModel: ToDoListCellViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(viewModel.isCompleted ? Color("#F0F4FF") : Color("#F6F6F6"))
                .frame(width: 341, height: 68)
                .cornerRadius(12)
            
            HStack {
                Button(action: {
                    viewModel.isCompleted.toggle()
                }) {
                    Image(viewModel.isCompleted ? "PlanedIcon" : "PlanIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 28, height: 28)
                        .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: -20))
                }
                
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 40, height: 40)
                        .cornerRadius(6)
                        .padding(.leading, 24)
                    
                    Text("🌕")
                        .padding(.leading, 24)
                }
                
                VStack {
                    HStack {
                        Text(viewModel.toDoTitle)
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
                        
                        Text("\(viewModel.hour):\(viewModel.minute)")
                            .foregroundColor(.black)
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: -6, leading: -4, bottom: -1, trailing: 0))
                        
                        Spacer()
                    }
                }
                
                Button(action: {
                    print("더보기를 눌렀습니다")
                    showToDoEditSheet = true
                }) {
                    Image("MoreButtondarken")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0))
                }
                .sheet(isPresented: $showToDoEditSheet) {
                    ToDoEditFirstActionSheet(viewModel: viewModel)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
struct ToDoListCell_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListCell(viewModel: ToDoListCellViewModel(toDoTitle: "미리보기 할 일", time: "오후 2:00"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

