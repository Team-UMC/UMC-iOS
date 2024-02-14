//
//  BoardComment.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/15/24.
//

import Foundation

class BoardComment {
    typealias Identifier = String
    var id: Identifier = ""
    var writer: Member  = Member()
    var board: Board = Board()
    var boardComment: BoardComment?
    var content: String = ""

}
