//  UserProfileSocialAdd.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/22.
//

import SwiftUI

struct UserProfileSocialAdd: View {
    @State private var socialImageName = "User_Add"
    var profileImage = "profileImage"
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    
    var body: some View {
        ZStack {
            //배경
            Image("backgroundImage_2")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                UserProfile(user: Member())  // 사진, 대학 라벨
                HStack(spacing: 8) {
                    AbleStack(member: Member())    // 기술
                    UMCSeason(member: Member())    // 기수
                }
                SocialButtonSet()  // 친구 추가 및 쪽지 보내기
                UserMessage()  // 상태 메세지 및 버튼
            }
            .padding(.bottom, 60)
        }
    }
}

#if DEBUG
struct UserProfileSocialAdd_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileSocialAdd()
    }
}
#endif


