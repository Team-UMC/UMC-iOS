//  UserProfile.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI


struct UserProfile: View {
    var memberInfo: MemberResponse.GetMemberProfile
    
    var body: some View {
        VStack{
            // 프로필 이미지
            AsyncImage(url: URL(string: memberInfo.profileImage ?? "")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear))
                    .padding(.bottom, -20)
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear))
                    .padding(.bottom, -20)
            }
                
            
            //대학 라벨
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(20)
                    .frame(width: 89, height: 25)
                    .shadow(radius: 5)
                Text(memberInfo.universityName)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
            }
            .padding(.bottom,-4)
            
            // 이름 라벨
            Text("\(memberInfo.nickname) / \(memberInfo.name)")
                .foregroundColor(.black)
                .padding(.horizontal, 30)
                .font(.system(size: 20).bold())
                .padding(.top, 8)
            
        }
        .padding(.bottom,16)
    }
    }
    



