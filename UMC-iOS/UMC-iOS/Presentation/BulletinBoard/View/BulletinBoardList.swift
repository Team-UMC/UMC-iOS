//
//  BulletinBoardList.swift
//  BulletinBoardUI
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct BulletinBoardList: View {
    @State private var contentData: [Int] = Array(0..<10)

    var body: some View {
        VStack{
            List {
                ForEach(contentData, id: \.self) { index in
                    UserContentPreList()
                        .listRowInsets(EdgeInsets())
                        .padding(.bottom,20)
                        .padding(.top,20)

                }
            }
            .listStyle(PlainListStyle())
            .cornerRadius(12)
        }

    }
}

struct BulletinBoardList_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoardList()
    }
}


