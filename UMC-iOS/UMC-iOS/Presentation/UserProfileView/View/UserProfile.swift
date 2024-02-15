//  UserProfile.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI


struct UserProfile: View {
    var user: Member
    var body: some View {
        VStack{
            // 프로필 이미지
            Image(user.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.clear))
                .padding(.bottom, -20)
            
            //대학 라벨
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(20)
                    .frame(width: 89, height: 25)
                    .shadow(radius: 5)
                Text(user.university)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
            }
            .padding(.bottom,-4)
            
            // 이름 라벨
            Text("\(user.nickname) / \(user.name)")
                .foregroundColor(.black)
                .padding(.horizontal, 30)
                .font(.system(size: 20).bold())
                .padding(.top, 8)
            
        }
        .padding(.bottom,16)
    }
    }
    



