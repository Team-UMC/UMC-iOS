//
//  ContentViewModel.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import SwiftUI

class ToDoListCellViewModel: ObservableObject {
    @Published var isCompleted = false
    @Published var toDoTitle = ""
    @Published var hour = "00"
    @Published var minute = "00"

    // 초기화 메서드
    init(toDoTitle: String, time: String) {
        self.toDoTitle = toDoTitle
        let components = time.components(separatedBy: ":")
        if components.count == 2 {
            self.hour = components[0]
            self.minute = components[1]
        }
    }
}
