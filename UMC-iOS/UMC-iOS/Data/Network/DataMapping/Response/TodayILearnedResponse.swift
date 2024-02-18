//
//  TodayILearnedResponse.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/15.
//

import Foundation

struct TodayILearnedResponse: Codable {
    struct TodayILearnedInfo: Codable {
        var todayILearnedId: String = ""
        var title: String = ""
        var subTitle: String = ""
        var part: String = ""

    }
    struct GetTodayILearned: Codable {
        var todayILearnedInfos: [TodayILearnedInfo] = []
    }

}

