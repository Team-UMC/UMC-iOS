//
//  UniversityRequest.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/11/24.
//

import Foundation

struct UniversityRequest {
    struct FeedUniversityMascot: Codable {
        let pointType: PointType
    }
}

extension UniversityRequest {
    struct StaffCreateUniversity {
        let universityName: String
        let universityLogo: String
        let semesterLogo: String
        let semester: Semester
    }
}
