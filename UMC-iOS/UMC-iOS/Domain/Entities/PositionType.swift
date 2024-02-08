//
//  PositionType.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

enum PositionType {
    case CENTER
    case CAMPUS
    
    var toKorean: String {
        switch self {
        case .CENTER:
            return "중앙"
        case .CAMPUS:
            return "교내"
        }
    }
}
