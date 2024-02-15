//
//  MemberRequest.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

class MemberRequest {
    struct SignUpMember: Codable {
        let name: String
        let nickname: String
        let semesterParts: [SemesterPart]
        let universityName: String
        let campusPositions: [String]
        let centerPositions: [String]
    }
    
    struct SocialLogin: Codable {
        let accessToken: String
        let socialType: String
    }
    
    struct UpdateUserProfile: Codable {
        let name: String
        let nickname: String
        let statusMessage: String
    }

}

extension MemberRequest {
    struct SemesterPart: Codable {
        let part: String
        let semester: String
    }
}
