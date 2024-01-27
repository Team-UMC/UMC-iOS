//
//  DateValue.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/18.
//

import SwiftUI

// Date Value Model

struct DateValue: Identifiable, Codable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
