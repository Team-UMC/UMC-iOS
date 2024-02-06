//
//  CommetAddbar.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct CommetAddbar: View {
    @ObservedObject var viewModel: CommentInputViewModel
    
    var body: some View {
        HStack {
            
            HStack {
                TextField("댓글을 입력해주세요",  text: $viewModel.commentText) //텍스트 필드
                    .foregroundColor(Color("#4B4B4B"))
                    .font(.system(size: 12))
                    .padding(.leading,13.5)
                
                
                Button(action: {
                    viewModel.postComment()
                }) {
                    Image("commentAdd")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 18, height: 18)
                        .padding(.leading,13.5)
                        .padding(.trailing,13.5)
                }
                
            }
            .frame(width: 343,height: 39)
            .foregroundColor(Color("#F0F4FF"))
            .background(Color("#F0F4FF"))
            .cornerRadius(14)
            
            
            
        }
    
    }
}

struct CommetAddbar_Previews: PreviewProvider {
    static var previews: some View {
        CommetAddbar(viewModel: CommentInputViewModel())
    }
}
                 

