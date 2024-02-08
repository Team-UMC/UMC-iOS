//
//  Role.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

enum Role: Codable {
    case ADMIN
    case TOTAL_STAFF
    case CENTER_STAFF
    case BRANCH_STAFF
    case CAMPUS_STAFF
    case STAFF
    case MEMBER
    
    var toKorean: String {
        switch self {
        case .ADMIN:
            return "관리자"
        case .TOTAL_STAFF:
            return "총괄운영진"
        case .CENTER_STAFF:
            return "중앙운영진"
        case .BRANCH_STAFF:
            return "지부운영진"
        case .CAMPUS_STAFF:
            return "학교운영진"
        case .STAFF:
            return "운영진"
        case .MEMBER:
            return "챌린저"
        }
    }
    
    var korean: String {
        switch self {
        case .ADMIN:
            return "관리자"
        case .TOTAL_STAFF:
            return "총괄운영진"
        case .CENTER_STAFF:
            return "중앙운영진"
        case .BRANCH_STAFF:
            return "지부운영진"
        case .CAMPUS_STAFF:
            return "학교운영진"
        case .STAFF:
            return "운영진"
        case .MEMBER:
            return "챌린저"
        }
    }
    
    var priority: Int {
        switch self {
        case .ADMIN:
            return 0
        case .TOTAL_STAFF:
            return 1
        case .CENTER_STAFF:
            return 2
        case .BRANCH_STAFF:
            return 3
        case .CAMPUS_STAFF:
            return 4
        case .STAFF:
            return 5
        case .MEMBER:
            return 6
        }
    }
    
}
