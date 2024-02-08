//
//  Member.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import Foundation

class Member {
    var id: String = ""
    var clientId: String = ""
    var university: String = ""
    var branch: String = ""
    var profileImage: String = ""
    var remainPoint: Int = 0
    var contributionPoint: Int = 0
    var nickname: String = ""
    var name: String = ""
    var statusMessage: String = ""
    var socialType: SocialType
    var semesterParts: [SemesterParts]
    var positions: [MemberPosition]
    var role: Role
    var gitNickname: String = ""
    
    
    init(socialType: SocialType, semesterParts: [SemesterParts], positions: [MemberPosition], role: Role) {
        self.socialType = socialType
        self.semesterParts = semesterParts
        self.positions = positions
        self.role = role
    }
    
    
    
    
}

extension Member {
    struct SemesterParts {
        var id: String = ""
        var member: Member
        var semester: Semester
        var part: Part
        
        init(member: Member, semester: Semester, part: Part) {
            self.member = member
            self.semester = semester
            self.part = part
        }
    }
    
    struct MemberPosition {
        var id: String = ""
        var name: String = ""
        var positionType: PositionType
        
        init(positionType: PositionType) {
            self.positionType = positionType
        }
        
    }
    

}
