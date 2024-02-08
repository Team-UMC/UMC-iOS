//
//  BoardSearchLikedResultRequest.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/08.
//

import Foundation

class BoardSearchLikedResultRequest {
    
    struct Welcome: Codable {
        let result: Result
    }
    
    struct Result: Codable {
        let myBoardPageResponses: [MyBoardPageResponse]
        let totalPages: Int
        let page: Int
        let totalElements: Int
        let isLast: Bool
        let isFirst: Bool
    }
    
    struct MyBoardPageResponse: Codable {
        let boardID: String
        let hostType: String
        let boardType: String
        let title: String
        let hitCount: Int
        let heartCount: Int
        let createdAt: String
    }
}

