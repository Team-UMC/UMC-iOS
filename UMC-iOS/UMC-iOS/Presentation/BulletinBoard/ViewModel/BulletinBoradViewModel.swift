//
//  BulletinBoradViewModel.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/06.
//

import Foundation
import Combine

class UserContentPreListViewModel: ObservableObject {
    
    @Published var member = Member()
    @Published var boards = Board()
    @Published var boardnetwork = BoardNetwork()
}

extension UserContentPreListViewModel{

}

