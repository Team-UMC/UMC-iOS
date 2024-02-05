//
//  Comment.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/3/24.
//

import SwiftUI

struct Comment: View {
    let profileImage = "profileImage"
    let userName = "양유진"
    let userNickname = "더기"
    let userSeason = "5"
    let userPart = "Web"
    let Comment = "무슨 말씀이시죠..? 해내세요.. 할 수 있어요... 해내야만 해요.."
    let Time = "2024.02.01"
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            HStack{
                //프로필 이미지
                Image(profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 34, height: 34)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear))

                VStack(alignment: .leading){
                    //유저 이름 닉네임
                    Text("\(userNickname)/\(userName)")
                        .foregroundColor(.black)
                        .font(.system(size: 12))

                    Text("\(userSeason)기|\(userPart)")
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
                Text("\(Comment)").lineLimit(2)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .padding(.bottom,2)

            Text("\(Time)")
                .foregroundColor(.gray)
                .font(.system(size: 14))

        }
    }
}

#Preview {
    Comment()
}

