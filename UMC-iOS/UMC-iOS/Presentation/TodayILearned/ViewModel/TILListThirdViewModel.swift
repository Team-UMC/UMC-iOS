//
//  TILListThirdViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import Foundation

class NotionIntegrationViewModel: ObservableObject {
    @Published var isNotionIntegrated = false
    @Published var fileName = ""

    func integrateNotion() {
        // Perform Notion integration logic here
        fileName = "Notion File"
        isNotionIntegrated = true
    }

    func detachFile() {
        fileName = ""
        isNotionIntegrated = false
    }
}

