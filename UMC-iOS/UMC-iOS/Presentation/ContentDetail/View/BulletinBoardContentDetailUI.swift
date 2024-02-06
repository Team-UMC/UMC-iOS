//
//  BulletinBoardContentDetailUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct BulletinBoardContentDetailUI: View {
    @State private var contentData: [Int] = Array(0..<4)
    var body: some View {
        List{
            BulletinBoardContentDetail()
            ForEach(contentData, id: \.self) { index in
                Comment()
            }
            
        }
        .listStyle(PlainListStyle())
        
        //TextField
      //  CommetAddbar(text: .constant(""))
    }
}

#Preview {
    BulletinBoardContentDetailUI()
}

