//
//  PreViewContent.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/09.
//
import SwiftUI

struct BoardInfo: Codable {
    let id = UUID()
    let boardPageResponses: [BoardPageResponse]
    let page: Int
    let totalPages: Int
    let totalElements: Int
    let isFirst: Bool
    let isLast: Bool
}

struct BoardPageResponse: Codable {
    let writer: String
    let profileImage: String
    let title: String
    let thumbnail: String
    let content: String
    let hitCount: Int
    let heartCount: Int
    let commentCount: Int
    let createdAt: String
    let fixed: Bool
}
