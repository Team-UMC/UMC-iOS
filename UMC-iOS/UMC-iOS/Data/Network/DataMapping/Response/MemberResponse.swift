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
        let memberId: String
        let accessToken: String
        let refreshToken: String
        let serviceMember: Bool
    }
    
    struct MemberId: Codable {
        let memberId: String
    }
    
}

extension MemberResponse {
    struct SemesterParts: Codable {
        var part: String = ""
        var semester: String = ""
    }
}
