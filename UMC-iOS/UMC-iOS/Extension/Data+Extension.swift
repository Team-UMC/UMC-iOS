//
//  Data+Extension.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

extension Data {
    static func createJsonStringData(boundary: String, data: Data) -> Data {
        let body = NSMutableData()
        let boundaryPrefix = "--\(boundary)\r\n"

        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"request\"\r\n")
        body.appendString("Content-Type: application/json\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
//        body.appendString("--".appending(boundary.appending("--")))

        return body as Data
    }
    
    static func createFileData(boundary: String, data: Data, mimeType: String, fileName: String) -> Data {
        let body = NSMutableData()
        let boundaryPrefix = "--\(boundary)\r\n"

        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName).\(mimeType)\"\r\n")
        body.appendString("Content-Type: application/\(mimeType)\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
//        body.appendString("--".appending(boundary.appending("--")))

        return body as Data
    }
    
    func combineData(datas: [Data]) -> Data {
        let combinedData = NSMutableData()
        
        for data in datas {
            combinedData.append(data)
        }
        return combinedData as Data
    }
}
