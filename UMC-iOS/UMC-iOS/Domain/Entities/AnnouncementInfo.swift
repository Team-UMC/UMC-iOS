//
//  AnnouncementInfo.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/28.
//

import Foundation
import SwiftUI

struct AnnouncementInfo: Identifiable, Codable {
    var id = UUID().uuidString
    var title: String
    var mainText: String
    var date: Date = Date()
    var time: String
    var location: String
}
