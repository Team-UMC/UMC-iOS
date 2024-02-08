//
//  BaseResponseProtocol.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/9/24.
//

import Foundation

protocol BaseResponseProtocol: Codable {
    var timestamp: String { get }
    var code: String { get }
    var message: String { get }
    associatedtype ResultType: Codable
    var result: ResultType { get }
}
