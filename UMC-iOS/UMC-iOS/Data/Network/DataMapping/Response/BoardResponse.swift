//
//  BoardCellResponse.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/10.
//

import Foundation

struct BoardResponse: Codable {
    
    struct SpecificBoards: Codable {
        let id: Int?
        let boardPageElements: [BoardResponse.BoardPageElement]
        let page: Int
        let totalElements: Int
        let totalPages: Int
        let isFirst: Bool
        let isLast: Bool
        
    }
    

    struct BoardId: Codable {
        let id: Int?
        let boardId: String
    }
    
    
}
    extension BoardResponse {
        struct BoardPageElement: Codable {
            let title: String
            let profileImage: String
            let writer: String
            let boardID: String
            let content: String
            let thumbnail: String
            let hitCount: Int
            let commentCount: Int
            let heartCount: Int
            let createdAt: String
            let fixed: Bool
        }
    }

