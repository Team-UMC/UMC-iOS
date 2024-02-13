//
//  Comment.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct Comment: View {
    @ObservedObject var viewModel: CommentViewModel
    init(viewModel: CommentViewModel = CommentViewModel.dummyData()) {
           self.viewModel = viewModel
       }
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            HStack{
                //프로필 이미지
                Image(viewModel.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 34, height: 34)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear))
                
                VStack(alignment: .leading){
                    //유저 이름 닉네임
                    Text("\(viewModel.userNickname)/\(viewModel.userName)")
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                    
                    Text("\(viewModel.userSeason)기|\(viewModel.userPart)")
                        .foregroundColor(.gray)
                        .font(.system(size: 11))
                }
                Spacer()
                Spacer()
                    Button(action: {
                        
                    }) {
                        Image("MoreButtondarken")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 28, height: 38)
                    
                }
            }
            .padding(.bottom,4)
            
                //댓글
                Text("\(viewModel.comment)").lineLimit(2)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .padding(.bottom,2)
            
            Text("\(viewModel.time)")
                .foregroundColor(.gray)
                .font(.system(size: 14))
            
        }
    }
}

struct Comment_Previews: PreviewProvider {
    static var previews: some View {
        Comment()
    }
}

