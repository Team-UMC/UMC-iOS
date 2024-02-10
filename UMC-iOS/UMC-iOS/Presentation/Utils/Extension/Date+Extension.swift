//
//  Date+Extension.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

extension Date {

    
    static func stringToDateTime(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: dateString) else {
            fatalError("string to date 날짜 변환 실패")
            return Date()
        }
        
        return date
    }
}
