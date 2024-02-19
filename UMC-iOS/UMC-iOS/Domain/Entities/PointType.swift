//
//  PointType.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/11/24.
//

import Foundation

enum PointType: String, Codable {
    case PUDDING = "PUDDING"
    case DOUGHNUT = "DOUGHNUT"
    case ICE_CREAM = "ICE_CREAM"
    case ROLL_CAKE = "ROLL_CAKE"
    
    var description: String {
        switch self {
        case .PUDDING:
            return "은하수를 살짝 얹은 커스터드 푸딩"
        case .DOUGHNUT:
            return "은하스프링클 도넛"
        case .ICE_CREAM:
            return "태양이 물든 선샤인 샤베트 아이스크림"
        case .ROLL_CAKE:
            return "찬란한 별들이 쑥쑥 박힌 우주맛 롤케이크"
        }
    }
    
    
    var point: Int {
        switch self {
        case .PUDDING:
            return 1
        case .DOUGHNUT:
            return 5
        case .ICE_CREAM:
            return 10
        case .ROLL_CAKE:
            return 30
        }
    }
    
    var image: String {
        switch self {
        case .PUDDING:
            return "puddingImage"
        case .DOUGHNUT:
            return "donutImage"
        case .ICE_CREAM:
            return "icecreamImage"
        case .ROLL_CAKE:
            return "rollcakeImage"
        }
    }
    
}
