//
//  SocialButtonSet.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/2/24.
//

import SwiftUI

struct SocialButtonSet: View {
    var SocialimageName: String
    var profileImage = "profileImage"
    var textColor = UIColor(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1)

    var body: some View {
        HStack(spacing: 30) {
            // 친구 추가
            VStack {
                Image(SocialimageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                Text("친구 추가")
                    .font(.system(size: 10).bold())
            }

            // 쪽지 보내기
            VStack {
                Image("User_Mail")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)

                Text("쪽지보내기")
                    .font(.system(size: 10).bold())
            }
        }
        .padding(EdgeInsets(top: 32, leading: 0, bottom: 16, trailing: 0))
    }
}

struct SocialButtonSet_Previews: PreviewProvider {
    static var previews: some View {
        SocialButtonSet(SocialimageName: "User_Add")
    }
}
