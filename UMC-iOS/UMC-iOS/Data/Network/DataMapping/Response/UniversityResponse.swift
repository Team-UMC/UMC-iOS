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
}
