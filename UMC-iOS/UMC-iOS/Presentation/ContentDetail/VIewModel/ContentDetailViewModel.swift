//
//  ContentDetailViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

class BulletinBoardContentDetailViewModel: ObservableObject {
    @Published var profileImage: String
    @Published var userName: String
    @Published var userNickname: String
    @Published var userSeason: String
    @Published var userPart: String
    @Published var contentTitle: String
    @Published var contentPreview: String
    @Published var likeCount: Int
    @Published var commentCount: Int
    @Published var viewingCount: Int
    @Published var timeLine: Int
    @Published var contentImage: String
    @Published var time: String

    init(profileImage: String, userName: String, userNickname: String, userSeason: String, userPart: String, contentTitle: String, contentPreview: String, likeCount: Int, commentCount: Int, viewingCount: Int, timeLine: Int, contentImage: String, time: String) {
        self.profileImage = profileImage
        self.userName = userName
        self.userNickname = userNickname
        self.userSeason = userSeason
        self.userPart = userPart
        self.contentTitle = contentTitle
        self.contentPreview = contentPreview
        self.likeCount = likeCount
        self.commentCount = commentCount
        self.viewingCount = viewingCount
        self.timeLine = timeLine
        self.contentImage = contentImage
        self.time = time
    }

    static func dummyData() -> BulletinBoardContentDetailViewModel {
        return BulletinBoardContentDetailViewModel(
            profileImage: "profileImage",
            userName: "양유진",
            userNickname: "더기",
            userSeason: "5",
            userPart: "Web",
            contentTitle: "규칙적인 생활 그거 어떻게 하냐고..",
            contentPreview: "대체 게시판은 언제 맘에 들까.. 음음음 그러게 정말 언제 마음에 들까까... 알다가도 모르겠다.... 흑흑...",
            likeCount: 123,
            commentCount: 4,
            viewingCount: 4,
            timeLine: 1,
            contentImage: "ContentImage",
            time: "2024.02.01"
        )
    }
}

