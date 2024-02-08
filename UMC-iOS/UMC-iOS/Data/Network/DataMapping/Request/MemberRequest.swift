//
//  MemberRequest.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

class MemberRequest {
    struct SignUpMember: Codable {
        let id: Int
        let name: String
        let semesterParts: [SemesterParts]
        let universityName: String
        let campusPostions: [String]
        let centerPositions: [String]
    }
    
    struct SocialLogin: Codable {
        let accessToken: String
        let socialType: String
    }

}

extension MemberRequest {
    struct SemesterParts: Codable {
        let part: String
        let semester: String
    }
}
