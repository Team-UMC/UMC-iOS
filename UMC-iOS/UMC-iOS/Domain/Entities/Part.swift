//
//  Part.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

enum Part: String, Codable {
    case PM = "PM"
    case DESIGN = "DESIGN"
    case SPRING = "SPRING"
    case NODE = "NODE"
    case IOS = "IOS"
    case ANDROID = "ANDROID"
    case WEB = "WEB"
    case ETC = "ETC"
    
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
    
    static func StringToPart(partString: String) -> Part {
        switch partString {
        case "PM":
            return .PM
        case "Design":
            return .DESIGN
        case "Spring":
            return .SPRING
        case "Node":
            return .NODE
        case "iOS":
            return .IOS
        case "Android":
            return .ANDROID
        case "Web":
            return .WEB
        default:
            return .ETC
        }
    }
    
    
}
