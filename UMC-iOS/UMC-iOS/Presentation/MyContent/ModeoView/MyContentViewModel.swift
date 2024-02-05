//
//  MyContentViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/05.
//

import SwiftUI

class MyContentPreListViewModel: ObservableObject {
    @Published var contentTitle: String
    @Published var timeLine: Int
    @Published var contentFirstIndex: String
    @Published var contentSecondIndex: String
    @Published var contentIndex: String
    
    static func dummyData() -> MyContentPreListViewModel {
            return MyContentPreListViewModel(contentTitle: "더미_contentTitle", timeLine: 0, contentFirstIndex: "게시글", contentSecondIndex: "지부", contentIndex: "자유게시판")
        }
    
    init(contentTitle: String, timeLine: Int, contentFirstIndex: String, contentSecondIndex: String, contentIndex: String) {
        self.contentTitle = contentTitle
        self.timeLine = timeLine
        self.contentFirstIndex = contentFirstIndex
        self.contentSecondIndex = contentSecondIndex
        self.contentIndex = contentIndex
    }
}
