//
//  InviteResponse.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/18/24.
//

import Foundation

struct InviteResponse {
    struct VerifyInviteCode: Codable {
        let role: String
    }
}
