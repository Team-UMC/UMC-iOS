import SwiftUI
import Combine

class BulletinBoaardSearchResultViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [YourResultType] = []

    private var cancellables: Set<AnyCancellable> = []

    func performSearch() {
        guard !searchText.isEmpty else {
            // 검색어가 비어있으면 검색하지 않음
            return
        }

        // 서버에서 검색을 수행하고 결과를 업데이트하는 로직을 추가
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
