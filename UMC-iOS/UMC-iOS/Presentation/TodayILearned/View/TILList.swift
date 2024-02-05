//
//  TILList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct TILList: View {
    @State private var contentData: [Int] = Array(0..<5)
    var body: some View {
        List {
            ForEach(contentData, id: \.self) { index in
               TILCell(ToDoTitle: "")
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .padding(.bottom,-15)
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
    }




#Preview {
    TILList()
}

