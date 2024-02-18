//
//  UserData.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/9/24.
//

import Foundation

struct UserData {
    var university: String = ""
    var name: String? = ""
    var nickname: String = ""
    var semesterParts: [SemesterPart] = []
    var campusPositions: [String] = []
    var centerPositions: [String] = []
    
    static func joinviewSelectedInfoToMemberRequestSemesterPart(mappingArr: [JoinViewSelectedInfo]) -> [SemesterPart] {
        var partsDictionary: [SemesterPart] = []

        for semesterPart in mappingArr {
            
            let semester = semesterPart.selectedSemeseter!
            let part = semesterPart.selectedPart!
            
            partsDictionary.append(SemesterPart(semester: Semester.koreanToSemester(korean: semester),
                                                              part: Part.StringToPart(partString: part)))
        }
        return partsDictionary
    }
    
    static func EntityToMemberRequestSemesterPart(mappingArr: [SemesterPart]) -> [MemberRequest.SemesterPart] {
        var partsDictionary: [MemberRequest.SemesterPart] = []

        for semesterPart in mappingArr {
            
            let semester = semesterPart.semester
            let part = semesterPart.part
            
            partsDictionary.append(MemberRequest.SemesterPart(semester: semester.rawValue,
                                                              part: part.rawValue))
        }
        return partsDictionary
    }
}
