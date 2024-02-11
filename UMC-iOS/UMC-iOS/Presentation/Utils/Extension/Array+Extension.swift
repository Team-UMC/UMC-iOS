//
//  Array+Extension.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

extension Array where Element == TodoListResponse.TodoListInfo {
    func mapToToDoList() -> [TodoList] {
        return self.map { todoListInfo in
            let deadline = Date.stringToDateTime(dateString: todoListInfo.deadline)
            return TodoList(id: todoListInfo.todoListId, member: nil, title: todoListInfo.title, deadline: deadline, isCompleted: todoListInfo.completed)
        }
    }
}

extension Array where Element == UniversityResponse.UniversityInfo {
    func mapToUniversityList() -> [University] {
        return self.map { universityInfo in
            return University(id: universityInfo.universityId, name: universityInfo.universityName)
        }
    }
}

extension Array where Element == UniversityResponse.UniversityRank {
    func mapToUniversityList() -> [University] {
        return self.map { universityRankInfo in
            return University(universityLogo: universityRankInfo.universityLogo, name: universityRankInfo.universityName, totalPoint: universityRankInfo.universityPoint)
        }
    }
}
