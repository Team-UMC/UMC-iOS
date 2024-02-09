//
//  Member.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import Foundation

struct Member {
    typealias Identifier = String
    var id: Identifier = ""
    var clientId: String = ""
    var university: String = ""
    var branch: String = ""
    var profileImage: String = ""
    var remainPoint: Int = 0
    var contributionPoint: Int = 0
    var nickname: String = ""
    var name: String = ""
    var statusMessage: String = ""
    var socialType: SocialType?
    var semesterParts: [SemesterParts]?
    var positions: [MemberPosition]?
    var role: Role?
    var gitNickname: String = ""
    
    init() {
        self.socialType = .none
        self.semesterParts = []
        self.positions = []
        self.role = .none
    }
    
    init(socialType: SocialType, semesterParts: [SemesterParts], positions: [MemberPosition], role: Role) {
        self.socialType = socialType
        self.semesterParts = semesterParts
        self.positions = positions
        self.role = role
    }
    
}

extension Member {
    struct SemesterParts {
        var semester: Semester
        var part: Part
        
        init(semester: Semester, part: Part) {
            self.semester = semester
            self.part = part
        }
        
        init(semesterPart: MemberResponse.SemesterParts) {
            self.semester = Semester(rawValue: semesterPart.semester)!
            self.part = Part(rawValue: semesterPart.part)!
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


extension Member {
    init(memberProfile: MemberResponse.GetMemberProfile) {
        self.clientId = memberProfile.memberId
        self.university = memberProfile.universityName
        self.nickname = memberProfile.nickname
        self.name = memberProfile.name
        self.semesterParts = memberProfile.semesterParts.map { SemesterParts(semesterPart: $0) }
    }
}
