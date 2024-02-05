//
//  ManagerModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/26/24.
//

import SwiftUI


struct GenerationPart: Identifiable, Equatable {
    var id = UUID()
    var generation: String
    var part: String
}
