//
//  BoardCellResponse.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/10.
//

import Foundation

struct BoardCellResponse: Codable {
    
    struct Boards: Codable {
        let id: Int?
        let boardPageElements: [BoardCellResponse.BoardPageElement]
        let page: Int
        let totalElements: Int
        let totalPages: Int
        let isFirst: Bool
        let isLast: Bool
        
    }
    
    
}
    extension BoardCellResponse{
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
           // let fixed: Bool
        }
    }

