//
//  UserContentPreList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct UserContentPreList: View {
    @State private var isClicked = false
    var board = Board()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                //프로필 이미지
                Image(board.writer?.profileImage ?? "profileImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear))
                
                //유저 이름 닉네임
                Text("\(board.writer?.nickname ?? "")/\(board.writer?.name ?? "")")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                Spacer()
                
                //타임라인
                Text("\(board.hitCount)분전")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.horizontal, 21)
            }
            HStack{
                VStack(alignment: .leading, spacing: 2){
                    //게시글 제목
                    Text("\(board.title)")
                        .foregroundColor(.black)
                        .font(.system(size: 14).bold())
                    
                    //게시글 미리보기
                    Text("\(board.content)").lineLimit(2)
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                }
                
                //게시글 이미지
                Image("ContentImage")//board.contentImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56)
            }
            HStack{
                //좋아요
                Image("LikeIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing,-4)
                Text("\(board.heartCount)")
                    .foregroundColor(Color(red: 135/255, green: 132/255, blue: 255/255))
                    .font(.system(size: 12))
                    .padding(.trailing,6)
                
                //댓글
                Image("ConmentIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing,-4)
                Text("\(board.commentCount)")
                    .foregroundColor(Color(red: 1.0, green: 199/255, blue: 0))
                    .font(.system(size: 12))
                    .padding(.trailing,6)
                
                //ViewingIcon
                Image("ViewingIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing,-2)
                Text("\(board.hitCount)")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .padding(.trailing,6)
            }
        }
        .padding(.horizontal, 21)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $isClicked) {
            BulletinBoardContentDetailUI()
        }
    }
}

struct UserContentPreList_Previews: PreviewProvider {
    static var previews: some View {
        UserContentPreList()
    }
}


