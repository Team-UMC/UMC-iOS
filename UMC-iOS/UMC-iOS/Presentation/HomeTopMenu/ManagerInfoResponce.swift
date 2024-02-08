//
//  ManagerInfoResponce.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/8/24.
//

import Foundation

class ManagerInfoResponce{
    // MARK: - PostChallengerInfo
    struct PostChallengerInfo: Codable {
        let campusPositions, centerPositions: [String]
        let semesterParts: [SemesterPart]
    }
}

extension ManagerInfoResponce{
    struct SemesterPart: Codable {
        let part, semester: String
    }
}
