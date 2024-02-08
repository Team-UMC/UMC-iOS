//
//  BoardSearchMyWritedResultRequest.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/08.
//  내가 쓴 게시물 결과 조회

import Foundation

class BoardSearchMyWritedResultRequest {
    
    struct Welcome: Codable {
        let result: Result
    }
    
    struct Result: Codable {
        let myBoardPageResponses: [MyBoardPageResponse]
        let page: Int
        let totalPages: Int
        let totalElements: Int
        let isLast: Bool
        let isFirst: Bool
    }
    
    struct MyBoardPageResponse: Codable {
        let boardID: String
        let hostType: String
        let boardType: String
        let title: String
        let heartCount: Int
        let hitCount: Int
        let createdAt: String
    }
    
    
}
