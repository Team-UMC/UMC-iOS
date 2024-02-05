//
//  BulletinBoardSearchModelView.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/05.
//

import SwiftUI
import Combine

class BulletinBoardSearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [YourResultType] = []

    private var cancellables: Set<AnyCancellable> = []

    func performSearch() {
        // 결과를 업데이트
        performSearchPublisher()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] results in
                      self?.searchResults = results
                  })
            .store(in: &cancellables)
    }

    func performSearchPublisher() -> AnyPublisher<[YourResultType], Error> {
        return Just(DummyData.searchResults)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

struct YourResultType {
    var title: String
    var description: String

}

struct DummyData {
    static let searchResults: [YourResultType] = [
        YourResultType(title: "검색 결과 1", description: "검색 결과 1에 대한 설명"),
        YourResultType(title: "검색 결과 2", description: "검색 결과 2에 대한 설명"),
    ]
}
