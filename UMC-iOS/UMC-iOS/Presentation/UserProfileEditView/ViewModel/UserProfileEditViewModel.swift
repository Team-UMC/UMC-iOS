//
//  UserProfileEditViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

class UserProfileEditViewModel: ObservableObject {
    @Published var userNickname: String
    @Published var userName: String
    @Published var message: String

    init(userNickname: String, userName: String, message: String) {
        self.userNickname = userNickname
        self.userName = userName
        self.message = message
    }
}


