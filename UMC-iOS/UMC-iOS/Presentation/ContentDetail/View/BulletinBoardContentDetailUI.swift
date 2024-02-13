//
//  BulletinBoardContentDetailUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct BulletinBoardContentDetailUI: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var contentData: [Int] = Array(0..<4)
    
    var body: some View {
        
        DetailNavigationBar()
        
        List{
            BulletinBoardContentDetail()
            ForEach(contentData, id: \.self) { index in
                Comment()
            }
            
        }
        .listStyle(PlainListStyle())
        
        //TextField
        CommetAddbar(viewModel: CommentInputViewModel())
        
            .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    BulletinBoardContentDetailUI()
}

