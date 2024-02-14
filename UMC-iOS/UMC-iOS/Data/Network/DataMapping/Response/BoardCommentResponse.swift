//
//  BoardCommentResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/15/24.
//

import Foundation

struct BoardCommentResponse {
    struct BoardCommentId: Codable {
        let commentId: String
    }
    
    struct GetSpecificBoardComments: Codable {
        let boardCommentPageElements: [BoardCommentPageElement]
        let page: Int
        let totalElements: Int
        let totalPages: Int
        let isFirst: Bool
        let isLast: Bool
    }
}

extension BoardCommentResponse {
    struct BoardCommentPageElement: Codable {
        let commentId: String
        let writer: String
        let profileImage: String?
        let semester: String
        let part: String
        let content: String
        let createdAt: String
    }
}
