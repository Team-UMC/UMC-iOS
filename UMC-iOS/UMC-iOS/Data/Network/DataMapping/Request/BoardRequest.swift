//
//  BoardRequest.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

struct BoardRequest {
    struct CreateBoard: Codable {
        let title: String
        let content: String
        let host: String
        let board: String
    }
    
    struct UpdateBoard: Codable {
        let title: String
        let content: String
        let host: String
        let board: String
    }
    
}
