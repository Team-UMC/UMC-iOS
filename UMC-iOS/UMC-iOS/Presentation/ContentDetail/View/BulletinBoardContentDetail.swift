//
//  BulletinBoardContentDetail.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct BulletinBoardContentDetail: View {
    
    @ObservedObject var viewModel: BulletinBoardContentDetailViewModel
    
    init(viewModel: BulletinBoardContentDetailViewModel = BulletinBoardContentDetailViewModel.dummyData()) {
            self.viewModel = viewModel
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            HStack{
                //프로필 이미지
                Image(viewModel.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear))
                
                VStack(alignment: .leading){
                    //유저 이름 닉네임
                    Text("\(viewModel.userNickname)/\(viewModel.userName)")
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                    
                    Text("\(viewModel.userSeason)기|\(viewModel.userPart)")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                }
                Spacer()
                    Button(action: {
                        
                    }) {
                        Image("MoreButtondarken")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 28, height: 38)
                    
                }
            }
            .padding(.bottom,10)
            .padding(.top,6)
            
            //게시글 제목
            Text("\(viewModel.contentTitle)")
                .foregroundColor(.black)
                .font(.system(size: 14).bold())
                .padding(.bottom,6)
            
            //게시글 미리보기
            Text("\(viewModel.contentPreview)").lineLimit(2)
                .foregroundColor(.black)
                .font(.system(size: 12))
                .padding(.bottom,12)
            
            HStack{
                //좋아요
                Image("LikeIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing,-4)
                Text("\(viewModel.likeCount)")
                    .foregroundColor(Color(red: 135/255, green: 132/255, blue: 255/255))
                    .font(.system(size: 12))
                    .padding(.trailing,6)
                
                //댓글
                Image("ConmentIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing,-4)
                Text("\(viewModel.commentCount)")
                    .foregroundColor(Color(red: 1.0, green: 199/255, blue: 0))
                    .font(.system(size: 12))
                    .padding(.trailing,6)
                
                //ViewingIcon
                Image("ViewingIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing,-2)
                Text("\(viewModel.viewingCount)")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .padding(.trailing,6)
            }
            .padding(.bottom,6)
            
            HStack{
                DetailButton()
                Spacer()
                Text("\(viewModel.time)")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            .padding(.bottom,16)
        }
    }
}




struct BulletinBoardContentDetail_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoardContentDetail()
    }
}

