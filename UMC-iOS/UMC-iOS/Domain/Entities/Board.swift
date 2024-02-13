//
//  Board.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

struct Board {
    typealias Identifier = String
    var id: Identifier = ""
    var writer: Member?
    var title: String = ""
    var content: String = ""
    var semesterPermission: [Semester]
    var hostType: HostType?
    var boardType: BoardType?
    var hitCount: Int = 0
    var heartCount: Int = 0
    var commentCount: Int = 0
    var isFixed: Bool = false
    
    init(id: Identifier, writer: Member? = nil, title: String, content: String, semesterPermission: [Semester], hostType: HostType? = nil, boardType: BoardType? = nil, hitCount: Int, heartCount: Int, commentCount: Int, isFixed: Bool) {
        self.id = id
        self.writer = writer
        self.title = title
        self.content = content
        self.semesterPermission = semesterPermission
        self.hostType = hostType
        self.boardType = boardType
        self.hitCount = hitCount
        self.heartCount = heartCount
        self.commentCount = commentCount
        self.isFixed = isFixed
    }
    
    init() {
        self.writer = Member()
        self.semesterPermission = []
        self.hostType = .none
        self.boardType = .none
    }

}

extension Board {
}
