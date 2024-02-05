//
//  UserProfileView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/2/24.
//

import SwiftUI

struct UserProfileView: View {
    @State private var backgroundImage = "backgroundImage_2"
    @State private var profileImage = "profileImage"
    @State private var UnivName = "인하대학교"
    @State private var userName = "양유진"
    @State private var userNickname = "더기"
    
    var body: some View {
        NavigationView {
            ZStack {
                // 배경
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack {
                    // 프로필 이미지
                    Image(profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.clear))
                        .padding(.bottom, -20)
                    
                    ZStack {
                        // 대학 라벨
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(20)
                            .frame(width: 115, height: 30)
                            .padding(.horizontal, 20)
                            .shadow(radius: 5)
                        
                        Text(UnivName)
                            .foregroundColor(.black)
                            .padding(.horizontal, 30)
                            .font(.system(size: 16))
                    }
                    
                    // 이름 라벨
                    Text("\(userNickname) / \(userName)")
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                        .font(.system(size: 20).bold())
                        .padding(.bottom, 8)
                    
                    
                    ZStack {
                        // 사용 기술 및 기수
                        HStack(spacing: 10){
                            ForEach(0..<2) { _ in
                                Rectangle()
                                    .fill(Color.white)
                                    .cornerRadius(20)
                                    .frame(width: 78, height: 32)
                            }
                        }
                        .shadow(color:.gray.opacity(0.3), radius: 10)
                        
                        HStack(spacing:32){
                            HStack(spacing:8){
                                Image("Figma")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 24, height: 24)
                                
                                Image("Image")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 24, height: 24)
                            }
                            
                            HStack(spacing:8){
                                Image("5th")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 24, height: 24)
                                
                                Image("6th")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 24, height: 24)
                            }
                        }
                        
                        
                    }
                    .padding(.bottom, 13)
                    // 친구 추가 & 쪽지 보내기
                    HStack(spacing: 30) {
                        // 친구 추가
                        VStack {
                            Image("User_Add")
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
                    .padding(.bottom, 32)
                    
                    // 상태 메세지
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(12)
                            .shadow(color:.gray.opacity(0.3), radius: 5)
                            .frame(width: 280, height: 75)
                        VStack(spacing: 8) {
                            Text("상태 메세지")
                                .font(.system(size: 14).bold())
                            Text("상태메세지를 입력해주세요.")
                                .font(.system(size: 16))
                        }
                    }
                    .padding(.bottom, 10)
                    
                    NavigationLink(destination: UserProfileEdit(profileImage: profileImage, message: .constant("상태메세지를 입력해주세요"), userNickname:.constant("더기"),userName:.constant("양유진") )) {
                        Text("수정하기")
                            .font(.system(size: 16, weight: .black))
                            .padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16))
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(17.5)
                            .shadow(radius: 10)
                    }
                }
                .offset(CGSize(width:0, height: -40))
                .onAppear {
                    // 서버에서 데이터를 가져와서 @State 속성에 할당하는 로직을 추가하세요.
                    // 예: 서버로부터 사용자 데이터를 가져와서 userNickname, userName 등을 설정합니다.
                    // 예: 실제 앱에서는 네트워킹 코드를 사용하여 데이터를 가져오게 됩니다.
                    // 예제에서는 간단한 텍스트 값을 설정하고 있습니다.
                    fetchDataFromServer()
                    
                }
            }
        }
    }
    
    private func fetchDataFromServer() {
        // 네트워킹 코드 추가
        // 서버로부터 사용자 데이터를 가져와서 @State 속성에 할당하는 로직을 구현하세요.
        // 예: userNickname, userName 등에 서버에서 받아온 데이터를 할당합니다.
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
