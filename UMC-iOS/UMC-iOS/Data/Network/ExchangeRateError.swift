//
//  ExchangeRateError.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import Foundation

enum ExchangeRateError: Error {
    case badRequest
    case decodeFailed
    case cannotCreateURL
}
