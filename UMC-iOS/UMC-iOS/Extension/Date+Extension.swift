//
//  Date+Extension.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/10/24.
//

import Foundation

extension Date {

    
    static func stringToDateTime(dateString: String) -> Date {
        guard let convertedDateString = String.convertDateFormat("2024-02-10T12:09:26.729") else {
            fatalError("string 날짜 포멧 변환 실패")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard let date = dateFormatter.date(from: convertedDateString) else {
            fatalError("string to date 날짜 변환 실패")
        }
        
        return date
    }
    

}

