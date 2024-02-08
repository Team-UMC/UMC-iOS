//
//  BoardSearchResultRequest.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/08.
//  게시글 검색 결과 조회

import Foundation

class BoardSearchResultRequest {
    
    struct Welcome: Codable {
        let result: Result
    }
    
    //Result
    struct Result: Codable {
        let boardPageResponses: [BoardPageResponse]
        let page: Int
        let totalPages: Int
        let totalElements: Int
        let isFirst: Bool
        let isLast: Bool
    }
    
    //[BoardPageResponse]
    struct BoardPageResponse: Codable {
        let profileImage: String
        let title: String
        let writer: String
        let boardID: String
        let content, thumbnail: String
        let commentCount: Int
        let heartCount: Int
        let hitCount: Int
        let createdAt: String
        let fixed: Bool
    }
}

