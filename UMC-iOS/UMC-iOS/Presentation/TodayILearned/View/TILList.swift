//
//  TILList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct TILList: View {
    @StateObject private var viewModel: TILCellViewModel

    init() {
        let dummyViewModel = TILCellViewModel(toDoTitle: "Dummy Title", tilIcon: "😀", dayAndNight: "AM", hour: "08", minute: "45")
        _viewModel = StateObject(wrappedValue: dummyViewModel)
    }

    var body: some View {
        List {
            ForEach(0..<5, id: \.self) { index in
                TILCell(viewModel: viewModel)
                    .previewLayout(.fixed(width: 375, height: 100))
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
            .padding(.bottom, -15)
        }
        .listStyle(PlainListStyle())
    }
}

struct TILList_Previews: PreviewProvider {
    static var previews: some View {
        TILList()
    }
}


