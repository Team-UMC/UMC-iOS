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
    
    var description: String {
        switch self {
        case .PUDDING:
            return "은하수를 살짝 얹은 커스터드 푸딩"
        case .DOUGHNUT:
            return "은하스프링클 도넛"
        }
    }
    
    
    var point: Int {
        switch self {
        case .PUDDING:
            return 5
        case .DOUGHNUT:
            return 10
        }
    }
    
    var image: String? {
        switch self {
        case .PUDDING:
            return nil
        case .DOUGHNUT:
            return nil
        }
    }
    
}
