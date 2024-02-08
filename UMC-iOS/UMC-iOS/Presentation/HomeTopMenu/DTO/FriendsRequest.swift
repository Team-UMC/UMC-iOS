//
//  FriendsRequest.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/8/24.
//

import Foundation

class FriendsRequest{
    // MARK: - GetFriendList
    struct GetFriendList: Codable{
        let memberID: String
        let nickname: String
        let name: String
        let profileImage: String
        let universityName: String
        let campusPositions, centerPositions: [String]
        let semesterParts: [SemesterPart]
    }
}

extension FriendsRequest{
    struct SemesterPart: Codable {
        let part: String
        let semester: String
    }
}
