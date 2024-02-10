//
//  University.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/11/24.
//

import Foundation

struct University {
    typealias Identifier = String
    var id: Identifier = ""
    var mascot: Mascot?
    var universityLogo: String = ""
    var semesterLogo: String = ""
    var name: String = ""
    var totalPotin: Int = 0
    var currentLevel: Int = 1
    
    
    
}

extension University {
    // Mapper
    init(universityInfo: UniversityResponse.UniversityInfo) {
        self.id = universityInfo.universityId
        self.name = universityInfo.universityName
    }
}
