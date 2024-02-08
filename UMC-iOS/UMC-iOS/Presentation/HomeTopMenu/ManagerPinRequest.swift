//
//  ManagerPinRequest.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/8/24.
//

import Foundation

class ManagerPinRequest{
    // MARK: - PostSearch
    struct GetPostSearch: Codable {
        let boardSearchPageResponses: [BoardSearchPageResponse]
        let page: Int
        let totalPages: Int
        let totalElements: Int
        let isFirst: Bool
        let isLast: Bool
    }
    
    // MARK: - PostList
    struct GetPostList: Codable {
        let boardPageResponses: [BoardPageResponse]
        let page, totalPages, totalElements: Int
        let isFirst, isLast: Bool
    }
}

extension ManagerPinRequest{
    // MARK: - BoardSearchPageResponse
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
    
    // MARK: - BoardPageResponse
    struct BoardPageResponse: Codable {
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
        let fixed: Bool
    }
    
    
}
