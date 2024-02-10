//
//  ToDoList.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

struct ToDoList {
    typealias Identifier = String
    var id: Identifier = ""
    var member: Member?
    var title: String
    var deadline: Date
    var iscompleted: Bool
}
