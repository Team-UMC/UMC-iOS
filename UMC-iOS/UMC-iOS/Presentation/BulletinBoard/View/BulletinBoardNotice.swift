//
//  BulletinBoardNotice.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

struct BulletinBoardNotice: View {
    var body: some View {
        Rectangle()
            .frame(width: 341, height: 208)
            .cornerRadius(12)
            .padding(EdgeInsets(top: 16, leading: 44, bottom: 16, trailing: 44))
            .overlay(
                ZStack {
                    Text("안녕하세요 챌린저님!\n\n본 게시판은 챌린저님이 UMC 활동을 하시면서 느낀\n불편 사항 및 건의 사항을 듣기 위해 만들어졌습니다.\n\n운영진들이 챌린저님의 건의 사항을 귀담아듣고,\n개선시켜 나갈 것을 약속드립니다.\n\n챌린저님들 또한 운영진들을 존중해 주시길 부탁드립니다.\n\n(무차별적인 비하 및 폭언을 금하며, 추후 UMC 활동에 제재를 받으실 수 있습니다.)")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 49))
                }
            )

    }
}

#Preview {
    BulletinBoardNotice()
}
