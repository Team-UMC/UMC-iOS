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
    
    
    // 얘를 인터페이스로 바꾸기.
    func joinMember(socialToken: Token, completion: @escaping () -> Void) {
        // UserDefaults에 사용자 인증 정보 저장
        UserDefaults.standard.set(socialToken.accessToken, forKey: "accessToken")
        UserDefaults.standard.set(socialToken.authProvider, forKey: "authProvider")
        UserDefaults.standard.set(socialToken.authorizationCode, forKey: "authorizationCode")
        
        Task {
            await fetchSignUpWithSocialLogin(socialLoginInfo: MemberRequest.SocialLogin(accessToken: socialToken.accessToken!, socialType: socialToken.authProvider!))
        }
        
        // UserDefaults에 저장된 데이터 확인
        print("Saved Access Token: \(UserDefaults.standard.string(forKey: "accessToken") ?? "")")
        print("Saved Auth Provider: \(UserDefaults.standard.string(forKey: "authProvider") ?? "")")
        print("Saved Authorization Code: \(UserDefaults.standard.string(forKey: "authorizationCode") ?? "")")
        
        // 로그인 상태 업데이트
        self.isLogined = true
        // 필요한 경우 추가적인 로직 수행
    }
}

extension UserViewModel {
    
    // POST
    @MainActor
    func fetchSignUpWithSocialLogin(socialLoginInfo: MemberRequest.SocialLogin) async {
        do {
            try await signUpWithSocialLogin(socialLoginInfo: socialLoginInfo)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func signUpWithSocialLogin(socialLoginInfo: MemberRequest.SocialLogin) async throws {
        
        
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.members_login.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "accessToken", value: socialLoginInfo.accessToken), URLQueryItem(name: "socialType", value: socialLoginInfo.socialType)]
        
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badResponse
        }
        
//        guard let jsonString = String(data: data, encoding: .utf8) else {
//            print("Error: Failed to convert data to string")
//            throw ExchangeRateError.decodeFailed
//        }

        do {
            let jsonDictionary = try JSONDecoder().decode(BaseResponse<MemberResponse.SignUpMember>.self, from: data)
            print(jsonDictionary.result)
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
    }
}
