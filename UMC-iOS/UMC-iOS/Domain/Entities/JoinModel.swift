//
//  JoinModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI


// GenerationPartSelection 선택에 대한 데이터 구조
struct JoinViewSelectedInfo: Identifiable {
    let id = UUID() // 고유 식별자
    var selectedPart: String = ""
    var selectedSemeseter: String = ""
}
