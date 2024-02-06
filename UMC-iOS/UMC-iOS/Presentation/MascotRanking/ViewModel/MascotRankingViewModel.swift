//
//  MascotRankingViewModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI


class MascotRankingViewModel: ObservableObject {
    @Published var selectedRanking: RankingType = .school
    
    // 학교 랭킹 데이터
    @Published var schoolRankings: [Ranking] = [
        Ranking(name: "숭실대학교", points: 2300, rank: 1),
        Ranking(name: "경희대학교", points: 1932, rank: 2),
        Ranking(name: "가천대학교", points: 1200, rank: 3),
        Ranking(name: "인하대학교", points: 932, rank: 4),
        // 다른 학교 랭킹 데이터...
    ]
    
    @Published var myContributions: [Ranking] = [
        Ranking(name: "민병", points: 970, rank: 1),
        Ranking(name: "규식", points: 922, rank: 2),
        Ranking(name: "민병", points: 870, rank: 3),
        Ranking(name: "규식", points: 822, rank: 4),
        Ranking(name: "민병", points: 770, rank: 5),
        Ranking(name: "규식", points: 622, rank: 6),
        // 초기 개인 기여도 데이터...
    ]

    enum RankingType {
        case school, personal
    }
}
