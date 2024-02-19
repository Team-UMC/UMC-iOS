//
//  BoardCellResponse.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/10.
//

import Foundation

struct BoardResponse: Codable {
    
    struct SpecificBoards: Codable {
        var id: Int?
        var boardPageElements: [BoardResponse.BoardPageElement] = []
        var page: Int = 0
        var totalElements: Int = 0
        var totalPages: Int = 0
        var isFirst: Bool = false
        var isLast: Bool = false
    }
    
    struct SearchBoards: Codable {
        var id: Int?
        var boardSearchPageElements: [BoardResponse.BoardPageElement] = []
        var page: Int = 0
        var totalElements: Int = 0
        var totalPages: Int = 0
        var isFirst: Bool = false
        var isLast: Bool = false
    }
    
    struct BoardId: Codable {
        var id: Int?
        var boardId: String = ""
    }
    
    struct GetBoardDetail: Codable {
        var id: Int?
        var hostType: String = ""
        var boardType: String = ""
        var writer: String = ""
        var profileImage: String? = ""
        var part: String = ""
        var semester: String = ""
        var title: String = ""
        var content: String = ""
        var boardFiles: [String] = []
        var hitCount: Int = 0
        var heartCount: Int = 0
        var commentCount: Int = 0
        var createdAt: String = ""
        var liked: Bool = false
    }
    
    struct GetMyBoards: Codable {
        var myBoardPageElements: [MyBoardPageElement]
        var page: Int = 0
        var totalElements: Int = 0
        var totalPages: Int = 0
        var isFirst: Bool = false
        var isLast: Bool = false
    }
    
    struct GetMyHeartBoards: Codable {
        var myBoardPageElements: [MyBoardPageElement]
        var page: Int = 0
        var totalElements: Int = 0
        var totalPages: Int = 0
        var isFirst: Bool = false
        var isLast: Bool = false
    }
    
    struct GetMyCommentBoards: Codable {
        var myBoardPageElements: [MyBoardPageElement]
        var page: Int = 0
        var totalElements: Int = 0
        var totalPages: Int = 0
        var isFirst: Bool = false
        var isLast: Bool = false
    }
    
    struct GetStaffNoticeBoards: Codable {
        var noticePageElements: [NoticePageElement]
        var page: Int = 0
        var totalElements: Int = 0
        var totalPages: Int = 0
        var isFirst: Bool = false
        var isLast: Bool = false
    }
    
    struct GetPinnedNotices: Codable {
        var pinnedNotices: [PinnedNotice] = []
    }
    
}
extension BoardResponse {
    struct BoardPageElement: Codable {
        var title: String = ""
        var profileImage: String? = ""
        var writer: String = ""
        var boardId: String = ""
        var content: String = ""
        var thumbnail: String? = ""
        var hitCount: Int = 0
        var commentCount: Int = 0
        var heartCount: Int = 0
        var createdAt: String
        var fixed: Bool = false
    }
    
    struct MyBoardPageElement: Codable {
        var boardId: String = ""
        var hostType: String = ""
        var boardType: String = ""
        var title: String = ""
        var hitCount: Int = 0
        var heartCount: Int = 0
        var createdAt: String = ""
    }
    
    struct NoticePageElement: Codable {
        var boardId: String = ""
        var hostType: String = ""
        var writer: String = ""
        var title: String = ""
        var hitCount: Int = 0
        var createdAt: String = ""
        var fixed: Bool = false
        
    }
    
    struct PinnedNotice: Codable {
        var hostType: String = ""
        var title: String = ""
        var boardId: String = ""
    }
    
}

