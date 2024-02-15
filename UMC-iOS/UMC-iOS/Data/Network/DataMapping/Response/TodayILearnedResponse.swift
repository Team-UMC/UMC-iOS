//
//  TodayILearnedResponse.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/15.
//

import Foundation

struct TodayILearnedResponse: Codable {
    struct TodayILearnedInfo: Codable {
        let todayILearnedID, title, subTitle, part: String

            enum CodingKeys: String, CodingKey {
                case todayILearnedID = "todayILearnedId"
                case title, subTitle, part
            }
    }
    struct GetTodayILearned: Codable {
        let part, title, subTitle, content: String
    }

}

