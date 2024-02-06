//
//  CommentInputViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//


import SwiftUI

class CommentInputViewModel: ObservableObject {
    @Published var commentText: String = ""

    func postComment() {
        let commentViewModel = CommentViewModel(
            profileImage: "profileImage",
            userName: "사용자명",
            userNickname: "닉네임",
            userSeason: "1",
            userPart: "iOS",
            comment: commentText,
            time: getCurrentTime()
        )

    }

    private func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: Date())
    }
}

