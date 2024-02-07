//
//  UserViewModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User = User()
    @Published var isLogined = false
    
    func userLogout() {
        self.user = User()
        isLogined = false
        print(user)
        print("로그아웃 성공(유저 초기화)")
    }
    
    // MARK: 오월이 API FUNCTIONS (Post)
        // 얘를 인터페이스로 바꾸기.
    func joinMember(socialToken: Token, completion: @escaping () -> Void) {
        // UserDefaults에 사용자 인증 정보 저장
        UserDefaults.standard.set(socialToken.accessToken, forKey: "accessToken")
        UserDefaults.standard.set(socialToken.authProvider, forKey: "authProvider")
        UserDefaults.standard.set(socialToken.authorizationCode, forKey: "authorizationCode")
        
        // UserDefaults에 저장된 데이터 확인
        print("Saved Access Token: \(UserDefaults.standard.string(forKey: "accessToken") ?? "")")
        print("Saved Auth Provider: \(UserDefaults.standard.string(forKey: "authProvider") ?? "")")
        print("Saved Authorization Code: \(UserDefaults.standard.string(forKey: "authorizationCode") ?? "")")
        
        // 로그인 상태 업데이트
        self.isLogined = true
        // 필요한 경우 추가적인 로직 수행
    }
}
