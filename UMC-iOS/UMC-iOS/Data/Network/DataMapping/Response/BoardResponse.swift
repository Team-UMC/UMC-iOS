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
    
    struct SearchBoards: Codable {
        let id: Int?
        let boardSearchPageElements: [BoardResponse.BoardPageElement]
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
    
    struct GetBoardDetail: Codable {
        let id: Int?
        let hostType: String
        let boardType: String
        let writer: String
        let profileImage: String?
        let part: String
        let semester: String
        let title: String
        let content: String
        let boardFiles: [String]
        let hitCount: Int
        let heartCount: Int
        let commentCount: Int
        let createdAt: String
        let liked: Bool
    }
    
    struct GetMyBoards: Codable {
        let myBoardPageElements: [MyBoardPageElement]
        let page: Int
        let totalElements: Int
        let totalPages: Int
        let isFirst: Bool
        let isLast: Bool
    }
    
    struct GetMyHeartBoards: Codable {
        let myBoardPageElements: [MyBoardPageElement]
        let page: Int
        let totalElements: Int
        let totalPages: Int
        let isFirst: Bool
        let isLast: Bool
    }
    
    struct GetMyCommentBoards: Codable {
        let myBoardPageElements: [MyBoardPageElement]
        let page: Int
        let totalElements: Int
        let totalPages: Int
        let isFirst: Bool
        let isLast: Bool
    }
    
    struct GetStaffNoticeBoards: Codable {
        let noticePageElements: [NoticePageElement]
        let page: Int
        let totalElements: Int
        let totalPages: Int
        let isFirst: Bool
        let isLast: Bool
    }
    
}
    extension BoardResponse {
        struct BoardPageElement: Codable {
            let title: String
            let profileImage: String?
            let writer: String
            let boardId: String
            let content: String
            let thumbnail: String?
            let hitCount: Int
            let commentCount: Int
            let heartCount: Int
            let createdAt: String
            let fixed: Bool
        }
        
        struct MyBoardPageElement: Codable {
            let boardId: String
            let hostType: String
            let boardType: String
            let title: String
            let hitCount: Int
            let heartCount: Int
            let createdAt: String
        }
        
        struct NoticePageElement: Codable {
            let boardId: String
            let hostType: String
            let writer: String
            let title: String
            let hitCount: Int
            let createdAt: String
            let fixed: Bool
            
        }
        
    }

