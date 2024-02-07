//
//  TILFileAddViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

class FileAttachmentViewModel: ObservableObject {
    @Published var isAttached = false
    @Published var fileName = ""

    func attachFile(name: String) {
        fileName = name
        isAttached = true
    }

    func detachFile() {
        fileName = ""
        isAttached = false
    }
}

