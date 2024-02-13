//
//  HostType.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

enum HostType: Codable {
    case CENTER
    case BRANCH
    case CAMPUS
    case ALL
    
    var toKorean: String {
        switch self {
        case .CENTER:
            return "연합"
        case .BRANCH:
            return "지부"
        case .CAMPUS:
            return "학교"
        case .ALL:
            return "전체(staff 공지사항용)"
        }
    }
    
    var priority: Int {
        switch self {
        case .CENTER:
            return 3
        case .BRANCH:
            return 4
        case .CAMPUS:
            return 5
        case .ALL:
            return 100
        }
    }
    
}
