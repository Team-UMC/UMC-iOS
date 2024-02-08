//
//  MemberResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

struct MemberResponse: Codable {
    struct GetMemberProfile: Codable {
        let id: Int
        let memberId: String
        let profileImage: String
        let universityName: String
        let name: String
        let nickname: String
        let semesterParts: [String]
        let statusMessage: String
        let owner: String
        
    }
}

extension MemberResponse {
    struct SemesterParts: Codable {
        let part: String
        let semester: String
    }
}
