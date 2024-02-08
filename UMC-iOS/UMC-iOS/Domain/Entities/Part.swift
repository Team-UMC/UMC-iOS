//
//  Part.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

enum Part {
    case PM
    case DESIGN
    case SPRING
    case NODE
    case IOS
    case ANDROID
    case WEB
    case ETC
    
    var toKorean: String {
        switch self {
        case .PM:
            return "피엠"
        case .DESIGN:
            return "디자인"
        case .SPRING:
            return "스프링"
        case .NODE:
            return "노드"
        case .IOS:
            return "아이오에스"
        case .ANDROID:
            return "안드로이드"
        case .WEB:
            return "웹"
        case .ETC:
            return "기타"
        }
    }
    
    var color: String {
        switch self {
        case .PM:
            return "RED"
        case .DESIGN:
            return "ORANGE"
        case .SPRING:
            return "YELLOW"
        case .NODE:
            return "GREEN"
        case .IOS:
            return "BLUE"
        case .ANDROID:
            return "NAVY"
        case .WEB:
            return "PURPLE"
        case .ETC:
            return "BLACK"
        }
    }
    
    
}
