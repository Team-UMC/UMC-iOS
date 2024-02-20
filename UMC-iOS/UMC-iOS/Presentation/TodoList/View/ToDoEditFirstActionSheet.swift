import SwiftUI

struct IconWithText: View {
    var imageName: String
    var text: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 19.5, height: 19.5)
            Text(text)
                .font(.system(size: 12))
        }
    }
}

struct ToDoEditFirstActionSheet: View {
    
    var toDoListCellViewModel: ToDoListCellViewModel
    var viewModel:TodoListViewModel
    
    @State private var todoListId: String = ""
    @State private var title: String = ""
    @State private var deadline: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.clear
                    ToDoEditSheet()

                    HStack(spacing: 52) {
                        NavigationLink(destination: ToDoEditSecondActionSheet(viewModel: ToDoListCellViewModel(toDoTitle: "", time: "", todoIcon: ""))) {
                            IconWithText(imageName: "ClockIcon", text: "시간 설정")
                        }

                        Button(action: {
                            // "수정하기" 버튼에 대한 액션 추가
                            Task {
                                await viewModel.fetchUpdateTodoList(todoListId: "123", todoInfo: TodoListRequest.UpdateTodo(title: title, deadline: "2024-02-10T14:35:03"))
                            }
                        }) {
                            IconWithText(imageName: "EditIcon", text: "수정하기")
                        }

                        Button(action: {
                            Task {
                                await viewModel.fetchDeleteTodoList(todoListId: TodoListRequest.DeleteTodo(todoListId: todoListId))
                            }
                        }) {
                            IconWithText(imageName: "DeleteIcon", text: "삭제하기")
                        }
                    }
                    .foregroundColor(Color("textColor"))
                    .padding()
                }
                
            }
            .background(Color(.clear))
        }
        .navigationBarHidden(true)
    }
}

//cellViewModel


