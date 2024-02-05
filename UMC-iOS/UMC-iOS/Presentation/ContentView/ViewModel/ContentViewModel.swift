import SwiftUI

class ToDoListCellViewModel: ObservableObject {
    @Published var isCompleted = false
    @Published var todoIcon = "🌕"
    @Published var toDoTitle = ""
    @Published var hour = "00"
    @Published var minute = "00"

    // 초기화 메서드
    init(toDoTitle: String, time: String, todoIcon: String) {
        self.toDoTitle = toDoTitle
        self.todoIcon = todoIcon
        let components = time.components(separatedBy: ":")
        if components.count == 2 {
            self.hour = components[0]
            self.minute = components[1]
        }
    }
}

class ToDoListViewModel: ObservableObject {
    @Published var toDoList: [ToDoListCellViewModel] = []

    func addNewCell(title: String, time: String, todoIcon: String) {
        let newCellViewModel = ToDoListCellViewModel(toDoTitle: title, time: time, todoIcon: todoIcon)
        toDoList.append(newCellViewModel)
    }
}

