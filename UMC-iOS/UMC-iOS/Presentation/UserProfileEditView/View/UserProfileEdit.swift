//  UserProfileEdit.swift
//  UserProfile
//
//  Created by 나예은 on 2024/01/09.
//

import SwiftUI

struct UserProfileEdit: View {
    var profileImage = "profileImage"
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    
    @State var message: String
    @State var userNickname: String
    @State var userName: String
    
    var body: some View {
        NavigationView {
            VStack {
                UserProfileEditImage()
                UserProfileEditList()
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
        UserProfileEdit(message: "", userNickname: "", userName: "")
    }
}


