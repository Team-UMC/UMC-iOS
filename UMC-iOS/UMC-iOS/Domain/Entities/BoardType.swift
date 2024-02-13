//
//  BoardType.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

enum BoardType:Codable {
    case NOTICE
    case FREE
    case WORKBOOK
    case QUESTION
    case OB
    
    var toKorean: String {
        switch self {
        case .NOTICE:
            return "공지"
        case .FREE:
            return "자유"
        case .WORKBOOK:
            return "워크북"
        case .QUESTION:
            return "질문"
        case .OB:
            return "이전기수"
        }
    }
}
