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
    var viewModel: ToDoListCellViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.clear
                    ToDoEditSheet()

                    HStack(spacing: 52) {
                        NavigationLink(destination: ToDoEditSecondActionSheet()) {
                            IconWithText(imageName: "ClockIcon", text: "시간 설정")
                        }

                        Button(action: {
                            // "수정하기" 버튼에 대한 액션 추가
                        }) {
                            IconWithText(imageName: "EditIcon", text: "수정하기")
                        }

                        Button(action: {
                            // "삭제하기" 버튼에 대한 액션 추가
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

struct ToDoEditFirstActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListAdd(viewModel: ToDoListCellViewModel(toDoTitle: "미리보기 할 일", time: "오후 2:00", todoIcon: "🌕"))
    }
}

