//
//  WritingSecondThirdViewModel.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/05.
//

import SwiftUI

class WritingListCellSecondViewModel: ObservableObject {
    @Published var title: String = ""
}

class WritingListThirdCellViewModel: ObservableObject {
    @Published var writingContent: String = ""
}
