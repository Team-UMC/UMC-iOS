//
//  CommetAddbar.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/3/24.
//

import SwiftUI

struct CommetAddbar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            //검색창
            HStack {
                TextField("글 제목, 내용을 입력해주세요", text: $text) //텍스트 필드
                    .foregroundColor(Color("#4B4B4B"))
                    .font(.system(size: 12))
                    .padding(.leading,13.5)

                //x버튼
                Button(action: {
                    print("지우기 버튼을 눌렀습니다")
                }) {
                    Image("commentAdd")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 18, height: 18)
                        .padding(.leading,13.5)
                        .padding(.trailing,13.5)
                }

            }
            .frame(width: 343,height: 39)
            .foregroundColor(Color("#F0F4FF"))
            .background(Color("#F0F4FF"))
            .cornerRadius(14)



        }

    }
}


#Preview {
    CommetAddbar(text: .constant(""))
}
