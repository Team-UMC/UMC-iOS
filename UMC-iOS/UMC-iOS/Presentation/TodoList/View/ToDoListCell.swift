//
//  ToDoListCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/30.
//

import SwiftUI

struct ToDoListCell: View {
    
    @StateObject var viewModel: ToDoListCellViewModel
    @State private var showToDoEditSheet = false
    
    init(viewModel: ToDoListCellViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @State var todoListId: String = ""
    
    var body: some View {
        ZStack {
            
            //선택할때 색 변경됨
            //상자
            Rectangle()
                .fill(viewModel.isCompleted ? Color("#F0F4FF") : Color("#F6F6F6"))
                .frame(width: 341, height: 68)
                .cornerRadius(12)
            
            //별 모양
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
                
                //아이콘
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 40, height: 40)
                        .cornerRadius(6)
                        .padding(.leading, 24)
                    
                    Text(viewModel.todoIcon)
                        .padding(.leading, 24)
                }
                
                VStack {
                    HStack {
                        Text(viewModel.toDoTitle) //할일
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    //시간
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
                
                //더보기 버튼
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
                    ToDoEditFirstActionSheet(toDoListCellViewModel: ToDoListCellViewModel(toDoTitle: "", time: "", todoIcon: ""), viewModel: TodoListViewModel())
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
struct ToDoListCell_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListCell(viewModel: ToDoListCellViewModel(toDoTitle: "Sample Task", time: "12:00", todoIcon: "0"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}



