//
//  MyContentList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/28.
//


import SwiftUI

struct MyContentList: View {
    
    @State private var contentData: [MyContentPreListViewModel] = [
        MyContentPreListViewModel.dummyData(),
    ]

    var body: some View {
        List(contentData.indices, id: \.self) { index in
            MyContentPreList(viewModel: contentData[index])
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
        }
        .cornerRadius(12)
        .listStyle(PlainListStyle())
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct MyContentList_Previews: PreviewProvider {
    static var previews: some View {
        MyContentList()
    }
}

