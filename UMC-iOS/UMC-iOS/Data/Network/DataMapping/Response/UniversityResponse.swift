//
//  UniversityResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/11/24.
//

import Foundation

struct UniversityResponse: Codable {
    struct UniversityInfo: Codable {
        var id: String? = ""
        var universityId: String = ""
        var universityName: String = ""
    }
    
    struct GetUniversityList: Codable {
        var joinUniversities: [UniversityInfo] = []
    }
    
    struct GetUniverSityDetail: Codable {
        var id: String? = ""
        var universityId: String = ""
        var universityName: String = ""
        var universityLogo: String = ""
        var universityPoint: Int = 1
        var universityRank: Int = 1
    }
    
    struct GetUniversityMascotInfo: Codable {
        var level: Int = 1
        var point: Int = 0
        var rank: Int = 1
        var universityName: String = ""
        var mascotImage: String? = ""
        var mascotDialog: [String] = []
    }
    
    struct UniversityRank: Codable, Hashable {
        var universityName: String = ""
        var universityLogo: String = ""
        var universityPoint: Int = 1
        var universityRank: Int = 1
    }
    
    struct GetUniversityRanks: Codable {
        var joinUniversityRanks: [UniversityRank] = []
    }
    
    struct UniversityContributorInfo: Codable {
        var nickname: String = ""
        var name: String = ""
        var profileImage: String? = ""
        var usedPoint: Int = 1
        var rank: Int = 1
    }
    
    struct GetUniversityContributors: Codable {
        var joinContributionRanks: [UniversityContributorInfo] = []
    }
    
    struct FeedUniversityMascot: Codable {
        var universityTotalpoint: Int = 1
        var memberRemainPoint: Int = 1
    }
    
    struct UniversityId: Codable {
        var universityId: String = ""
    }
    
    struct GetContributionRankingInCampus: Codable {
        var joinContributionRanks: [JoinContributioinRank] = []
    }
    
}

extension UniversityResponse {
    struct JoinContributioinRank: Codable, Hashable {
        var nickname: String = ""
        var name: String = ""
        var profileImage: String? = ""
        var usedPoint: Int = 0
        var rank: Int = 0
    }
}
