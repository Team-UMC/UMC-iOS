//
//  CommentViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

class CommentViewModel: ObservableObject {
    @Published var profileImage: String
    @Published var userName: String
    @Published var userNickname: String
    @Published var userSeason: String
    @Published var userPart: String
    @Published var comment: String
    @Published var time: String

    init(profileImage: String, userName: String, userNickname: String, userSeason: String, userPart: String, comment: String, time: String) {
        self.profileImage = profileImage
        self.userName = userName
        self.userNickname = userNickname
        self.userSeason = userSeason
        self.userPart = userPart
        self.comment = comment
        self.time = time
    }

    static func dummyData() -> CommentViewModel {
        return CommentViewModel(
            profileImage: "profileImage",
            userName: "양유진",
            userNickname: "더기",
            userSeason: "5",
            userPart: "Web",
            comment: "무슨 말씀이시죠..? 해내세요.. 할 수 있어요... 해내야만 해요..",
            time: "2024.02.01"
        )
    }
}

