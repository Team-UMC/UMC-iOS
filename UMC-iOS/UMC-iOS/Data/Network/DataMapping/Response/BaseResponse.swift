//
//  BaseResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/9/24.
//

import Foundation

struct BaseResponse<ResultType: Codable>: BaseResponseProtocol {
    let timestamp: String
    let code: String
    let message: String
    let result: ResultType
}
