//
//  TILViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import Foundation
import SwiftUI

class TILCellViewModel: ObservableObject {
    @Published var isCompleted: Bool
    @Published var showToDoEditSheet: Bool
    @Published var toDoTitle: String
    @Published var tilIcon: String
    @Published var dayAndNight: String
    @Published var hour: String
    @Published var minute: String
    @Published var TILTiltle: String
    @Published var TILSubtitle: String
    @Published var projectInfo: String

    init(isCompleted: Bool = false, showToDoEditSheet: Bool = false, toDoTitle: String, tilIcon: String, dayAndNight: String, hour: String, minute: String) {
        self.isCompleted = isCompleted
        self.showToDoEditSheet = showToDoEditSheet
        self.toDoTitle = toDoTitle
        self.tilIcon = tilIcon
        self.dayAndNight = dayAndNight
        self.hour = hour
        self.minute = minute
        self.TILTiltle = ""
        self.TILSubtitle = ""
        self.projectInfo = ""
    }

    init(toDoTitle: String, tilIcon: String, dayAndNight: String, hour: String, minute: String) {
        self.isCompleted = false
        self.showToDoEditSheet = false
        self.toDoTitle = toDoTitle
        self.tilIcon = tilIcon
        self.dayAndNight = dayAndNight
        self.hour = hour
        self.minute = minute
        self.TILTiltle = ""
        self.TILSubtitle = ""
        self.projectInfo = ""
    }

    func fetchDataFromServer() {
        toDoTitle = "New Title from Server"
        tilIcon = "🚀"
        dayAndNight = "AM"
        hour = "10"
        minute = "30"
    }

    func updateTitle(_ newTitle: String) {
        toDoTitle = newTitle
    }

    func updateSubProjectName(_ newSubProjectName: String) {
        TILSubtitle = newSubProjectName
    }

    func updateProjectInfo(_ newProjectInfo: String) {
        projectInfo = newProjectInfo
    }
}


