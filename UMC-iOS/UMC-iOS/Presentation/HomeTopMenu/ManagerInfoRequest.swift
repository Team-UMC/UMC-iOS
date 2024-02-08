//
//  ManagerInfoRequest.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/8/24.
//

import Foundation

class ManagerInfoRequest{
    // MARK: - GetChallengerInfoSearch
    struct GetChallengerInfoSearch: Codable {
        let members: [Member]
    }
}

extension ManagerInfoRequest{
    // MARK: - Member
    struct Member: Codable {
        let memberID: String
        let universityName: String
        let campusPositions: [String]
        let centerPositions: [String]
        let semesterParts: [SemesterPart]
    }
    // MARK: - SemesterPart
    struct SemesterPart: Codable {
        let part, semester: String
    }
}

