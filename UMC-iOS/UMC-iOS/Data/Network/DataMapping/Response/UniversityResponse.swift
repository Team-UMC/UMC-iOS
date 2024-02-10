//
//  UniversityResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/11/24.
//

import Foundation

struct UniversityResponse: Codable {
    struct UniversityInfo: Codable {
        let id: String?
        let universityId: String
        let universityName: String
    }
    
    struct GetUniversityList: Codable {
        let joinUniversities: [UniversityInfo]
    }
    
    struct GetUniverSityDetail: Codable {
        let id: String?
        let universityId: String
        let universityName: String
        let universityLogo: String
        let universityPoint: Int
        let universityRank: Int
    }
    
    struct GetUniversityMascotInfo: Codable {
        let level: Int
        let point: Int
        let rank: Int
        let mascotImage: String
        let mascotDialog: String
        let universityImage: String
    }
    
    struct UniversityRank: Codable {
        let universityName: String
        let universityLogo: String
        let universityPoint: Int
        let universityRank: Int
    }
    
    struct GetUniversityRanks: Codable {
        let joinUniversityRanks: [UniversityRank]
    }
    
    struct UniversityContributorInfo: Codable {
        let nickname: String
        let name: String
        let profileImage: String?
        let usedPoint: Int
        let rank: Int
    }
    
    struct GetUniversityContributors: Codable {
        let joinContributionRanks: [UniversityContributorInfo]
    }
    
    struct FeedUniversityMascot: Codable {
        let universityTotalpoint: Int
        let memberRemainPoint: Int
    }
    
}
