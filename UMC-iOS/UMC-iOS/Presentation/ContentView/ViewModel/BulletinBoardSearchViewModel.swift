//
//  BulletinBoardSearchViewModel.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/05.
//BulletinBoardList

import SwiftUI

class BulletinBoardViewModel: ObservableObject {
    @Published var BulletinBoardList: [UserContentPreList] = []

    var filteredList: [UserContentPreList] {
        if searchText.isEmpty {
            return BulletinBoardList
        }
        return BulletinBoardList.filter { $0.ContentTitle.contains(searchText) }
    }

    @Published var searchText = ""
}
