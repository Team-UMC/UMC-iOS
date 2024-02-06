//  UserProfile.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI


struct UserProfile: View {
    private var profileImage = "profileImage"
    private var UnivName = "인하대학교"
    private var userName = "양유진"
    private var userNickname = "더기"
    
    var body: some View {
        VStack{
            // 프로필 이미지
            Image(profileImage)
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
                Text(UnivName)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
            }
            .padding(.bottom,-4)
            
            // 이름 라벨
            Text("\(userNickname) / \(userName)")
                .foregroundColor(.black)
                .padding(.horizontal, 30)
                .font(.system(size: 20).bold())
                .padding(.top, 8)
            
        }
        .padding(.bottom,16)
    }
    }
    
    #Preview {
        UserProfile()
    }



