//
//  MemberResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

struct MemberResponse: Codable {
    struct GetMemberProfile: Codable {
        var id: Int? = 0
        var memberId: String = ""
        var profileImage: String? = ""
        var universityName: String = ""
        var name: String = ""
        var nickname: String = ""
        var semesterParts: [MemberResponse.SemesterParts] = []
        var statusMessage: String? = ""
        var owner: String = ""
    }
    
    struct GetAccessTokenWithSocialLogin: Codable {
        var memberId: String = ""
        var accessToken: String = ""
        var refreshToken: String = ""
        var serviceMember: Bool = false
    }
    
    struct MemberId: Codable {
        var memberId: String = ""
    }
    
    struct GetMemberRankInfo: Codable {
        var profileImage: String? = ""
        var nickname: String = ""
        var contributionPoint: Int = 0
        var contributionRank: Int = 0
    }
}

extension MemberResponse {
    struct SemesterParts: Codable {
        var part: String = ""
        var semester: String = ""
    }
}
