//
//  BoardCommentRequest.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/15/24.
//

import Foundation

struct BoardCommentRequest {
    struct CreateBoardComment: Codable {
        let boardId: String
        let content: String
    }
    
    struct UpdateBoardComment: Codable {
        let content: String
    }
}
