//
//  Semester.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

enum Semester {
    case FIRST
    case SECOND
    case THIRD
    case FOURTH
    case FIFTH
    
    var name: String {
        switch self {
        case .FIRST:
            return "1기"
        case .SECOND:
            return "2기"
        case .THIRD:
            return "3기"
        case .FOURTH:
            return "4기"
        case .FIFTH:
            return "5기"
        }
    }
    
    var color: String {
        switch self {
        case .FIRST:
            return "RED"
        case .SECOND:
            return "ORANGE"
        case .THIRD:
            return "YELLOW"
        case .FOURTH:
            return "GREEN"
        case .FIFTH:
            return "BLUE"
        }
    }
    
    var isActive: Bool {
        switch self {
        case .FIFTH:
            return true
        default:
            return false
        }
    }
    
    // 현재 기수 찾기
    static func findActiveSemester() -> Semester {
        for semester in [Semester.FIRST, .SECOND, .THIRD, .FOURTH, .FIFTH] {
            if semester.isActive {
                return semester
            }
        }
        // 기본값으로 마지막 항목 반환
        return .FIFTH
    }
}

//// 사용 예시
//let activeSemester = Semester.findActiveSemester()
//print("Active semester: \(activeSemester.name)")
