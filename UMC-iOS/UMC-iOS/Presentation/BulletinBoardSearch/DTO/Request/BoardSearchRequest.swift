//
//  BoardSearchRequest.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/08.
//  게시글 검색

import Foundation


class BoardSearchRequest {
    
    
    struct Welcome: Codable {
        let result: Result
    }
    
    struct Result: Codable {
        let boardSearchPageResponses: [BoardSearchPageResponse]
        let page: Int
        let totalPages: Int
        let totalElements: Int
        let isFirst: Bool
        let isLast: Bool
    }
} //class

extension BoardSearchRequest {
    struct BoardSearchPageResponse: Codable {
        let boardID: String
        let writer: String
        let profileImage: String
        let title: String
        let content: String
        let thumbnail: String
        let hitCount: Int
        let heartCount: Int
        let commentCount: Int
        let createdAt: String
        let hostType: String
        let boardType: String
        let fixed: Bool
    }
}





