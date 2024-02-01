//
//  MascotModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/29/24.
//

import SwiftUI

// 랭킹 정보를 나타내는 구조체
struct Ranking: Identifiable {
    let id = UUID() // 고유 식별자
    let name: String // 학교명 또는 개인명
    let points: Int // 점수
    let rank: Int // 순위
}
