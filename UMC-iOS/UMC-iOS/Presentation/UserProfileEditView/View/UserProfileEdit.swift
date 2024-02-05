//
//  UserProfileEdit.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/2/24.
//

import SwiftUI

struct UserProfileEdit: View {
    var profileImage = "profileImage"
    var textcolor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1)) // #404572
    @Binding var message: String
    @Binding var userNickname: String
    @Binding var userName: String
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Image(profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .background(Color.clear)
                        .padding(.bottom, 20)

                    Image(systemName: "camera.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 16)) // 이미지 크기 조절
                        .padding()
                        .background(Color(textcolor))
                        .clipShape(Circle())
                        .offset(x: 40, y: 30)
                        .frame(width: 16, height: 16)

                }

                List {
                    HStack(spacing: 8) {
                        Text("별명")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(textcolor))
                        TextField("더기", text: $userNickname)
                    }
                    HStack(spacing: 8) {
                        Text("이름")
                            .font(.system(size: 16).bold())
                            .foregroundColor(Color(textcolor))
                        TextField("양유진", text: $userName)
                    }
                    VStack {
                        Text("상태메세지")
                            .font(.system(size: 16).bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(textcolor))
                        TextField("양유진", text: $message)
                            .frame(height: 200)
                    }
                }
            }
            .navigationBarTitle("프로필 수정", displayMode: .inline) // 가운데 정렬
            .navigationBarItems(
                leading: Button(action: {
                    print("뒤로 가기 버튼이 눌렸습니다.")
                }) {
                    Image("arrow_back")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 11.25, height: 22.5)
                },
                trailing: Button(action: {
                    print("프로필 수정 버튼이 눌렸습니다.")
                }) {
                    Text("완료")
                        .font(.system(size: 14).bold())
                        .foregroundColor(.white)
                        .frame(width: 48, height: 30)
                        .background(Color(#colorLiteral(red: 0.5294117928, green: 0.5176470876, blue: 1, alpha: 1))) // #8784FF
                        .cornerRadius(25)
                }

            )
        }
    }
}

struct UserProfileEdit_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileEdit(message: .constant("상태메세지를 입력해주세요"),
                        userNickname: .constant("더기"),
                        userName:.constant("양유진"))
    }
}
