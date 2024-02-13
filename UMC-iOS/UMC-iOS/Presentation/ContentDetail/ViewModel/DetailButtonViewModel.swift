//
//  DetailButtonViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

class ContentDetailViewModel: ObservableObject {
    @Published var likeCount: Int = 0
    @Published var commentCount: Int = 0
    @Published var viewingCount: Int = 0
}

