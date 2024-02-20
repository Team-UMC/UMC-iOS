//
//  MascotRankingViewModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI


class MascotRankingViewModel: ObservableObject {
    @Published var myUniversityRankDetail: UniversityResponse.GetUniverSityDetail?
    @Published var universityRanks: UniversityResponse.GetUniversityRanks?
    @Published var memberRankInfo: MemberResponse.GetMemberRankInfo?
    @Published var contributionRanking: UniversityResponse.GetContributionRankingInCampus?
    
    init() {
        loadRankingData()
    }
    
    func loadRankingData() {
        Task {
            // 여기서 비동기 작업 수행
            myUniversityRankDetail = await UniversityNetwork.fetchGetUniversityDetail()
            universityRanks = await UniversityNetwork.fetchGetUniversityRanks()
            memberRankInfo = await MemberNetwork.fetchGetMemberRankInfo()
            contributionRanking = await UniversityNetwork.fetchGetContributionRankingInCampus()
        }
    }
    
//    @Published var selectedRanking: RankingType = .school
//    
//    // 학교 랭킹 데이터
//    @Published var schoolRankings: [Ranking] = [
//        Ranking(name: "숭실대학교", points: 2300, rank: 1),
//        Ranking(name: "경희대학교", points: 1932, rank: 2),
//        Ranking(name: "가천대학교", points: 1200, rank: 3),
//        Ranking(name: "인하대학교", points: 932, rank: 4),
//        // 다른 학교 랭킹 데이터...
//    ]
//    
//    @Published var myContributions: [Ranking] = [
//        Ranking(name: "민병", points: 970, rank: 1),
//        Ranking(name: "규식", points: 922, rank: 2),
//        Ranking(name: "민병", points: 870, rank: 3),
//        Ranking(name: "규식", points: 822, rank: 4),
//        Ranking(name: "민병", points: 770, rank: 5),
//        Ranking(name: "규식", points: 622, rank: 6),
//        // 초기 개인 기여도 데이터...
//    ]
//
//    enum RankingType {
//        case school, personal
//    }
}
