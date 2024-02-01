//
//  UserContentPreList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct UserContentPreList: View {
    var body: some View {
        let profileImage = "profileImage"
        let userName = "양유진"
        let userNickname = "더기"
        let ContentTitle = "규칙적인 생활 그거 어떻게 하냐고.."
        let ContentPreview = "대체 게시판은 언제 맘에 들까.. 음음음 그러게 정말 언제 마음에 들까까... 알다가도 모르겠다.... 흑흑..."
        let LikeCnt = 123
        let CommentCnt = 4
        let ViewingCnt = 4
        let TimeLine = 1
        let ContentImage = "ContentImage"
        
        VStack(alignment: .leading, spacing: 8){
            HStack{
                //프로필 이미지
                Image(profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear))
                
                //유저 이름 닉네임
                Text("\(userNickname)/\(userName)")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                Spacer()
                
                //타임라인
                Text("\(TimeLine)분전")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.horizontal, 21)
                
            }
            
            HStack{
                VStack(alignment: .leading, spacing: 2){
                    //게시글 제목
                    Text("\(ContentTitle)")
                        .foregroundColor(.black)
                        .font(.system(size: 14).bold())
                    
                    //게시글 미리보기
                    Text("\(ContentPreview)").lineLimit(2)
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                }
                
                //게시글 이미지
                Image(ContentImage)
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
                Text("\(LikeCnt)")
                    .foregroundColor(Color(red: 135/255, green: 132/255, blue: 255/255))
                    .font(.system(size: 12))
                    .padding(.trailing,6)
                
                //댓글
                Image("ConmentIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing,-4)
                Text("\(CommentCnt)")
                    .foregroundColor(Color(red: 1.0, green: 199/255, blue: 0))
                    .font(.system(size: 12))
                    .padding(.trailing,6)
                
                //ViewingIcon
                Image("ViewingIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing,-2)
                Text("\(ViewingCnt)")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .padding(.trailing,6)
            }
        }
        .padding(.horizontal, 21)
    }
}

struct UserContentPreList_Previews: PreviewProvider {
    static var previews: some View {
        UserContentPreList()
    }
}

