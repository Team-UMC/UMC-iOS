//
//  BulletinBoradViewModel.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/06.
//

import Foundation
import Combine

class UserContentPreListViewModel: ObservableObject {
    @Published var profileImage: String = ""
    @Published var userName: String = ""
    @Published var userNickname: String = ""
    @Published var contentTitle: String = ""
    @Published var contentPreview: String = ""
    @Published var likeCount: Int = 0
    @Published var commentCount: Int = 0
    @Published var viewingCount: Int = 0
    @Published var timeline: Int = 0
    @Published var contentImage: String = ""

    private var cancellables: Set<AnyCancellable> = []

    init() {
        fetchDataFromServer()
    }

    func fetchDataFromServer() {
        fetchDataPublisher()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] data in
                      self?.updateUI(with: data)
                  })
            .store(in: &cancellables)
    }

    func fetchDataPublisher() -> AnyPublisher<YourDataType, Error> {
        return Just(DummyData.sampleData)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func updateUI(with data: YourDataType) {
        profileImage = data.profileImage
        userName = data.userName
        userNickname = data.userNickname
        contentTitle = data.contentTitle
        contentPreview = data.contentPreview
        likeCount = data.likeCount
        commentCount = data.commentCount
        viewingCount = data.viewingCount
        timeline = data.timeline
        contentImage = data.contentImage
    }
}


struct YourDataType {
    var profileImage: String
    var userName: String
    var userNickname: String
    var contentTitle: String
    var contentPreview: String
    var likeCount: Int
    var commentCount: Int
    var viewingCount: Int
    var timeline: Int
    var contentImage: String
}

struct DummyData {
    static let sampleData = YourDataType(
        profileImage: "profileImage",
        userName: "양유진",
        userNickname: "더기",
        contentTitle: "규칙적인 생활 그거 어떻게 하냐고..",
        contentPreview: "대체 게시판은 언제 맘에 들까.. 음음음 그러게 정말 언제 마음에 들까까... 알다가도 모르겠다.... 흑흑...",
        likeCount: 123,
        commentCount: 4,
        viewingCount: 4,
        timeline: 1,
        contentImage: "ContentImage"
    )
}
