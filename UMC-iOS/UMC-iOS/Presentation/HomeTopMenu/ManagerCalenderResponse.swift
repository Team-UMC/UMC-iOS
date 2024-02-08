//
//  ManagerCalenderResponse.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/8/24.
//

import Foundation

class ManagerCalenderResponse{
    // MARK: - PostCalander
    struct PostCalander: Codable {
        let title: String
        let content: String
        let startDateTime: String
        let endDateTime: String
        let semesterPermission: [String]
        let hostType: String
        let placeSetting: String
    }
}
