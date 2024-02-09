//
//  LoginViewModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var member: Member = Member()
    @Published var serviceMember = false
    @Published var isLogined = false
    
    func userLogout() {
        self.member = Member()
        isLogined = false
        print(member)
        print("로그아웃 성공(유저 초기화)")
    }
    
    
    // 얘를 인터페이스로 바꾸기.
    func joinMember(socialToken: Token, completion: @escaping () -> Void) {
        // UserDefaults에 사용자 인증 정보 저장
        UserDefaults.standard.set(socialToken.accessToken, forKey: "accessToken")
        UserDefaults.standard.set(socialToken.authProvider, forKey: "authProvider")
        UserDefaults.standard.set(socialToken.authorizationCode, forKey: "authorizationCode")
        
        Task {
            await fetchGetAccessTokenWithSocialLogin(socialLoginInfo: MemberRequest.SocialLogin(accessToken: socialToken.accessToken!, socialType: socialToken.authProvider!))
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

extension LoginViewModel {
    
    // POST
    @MainActor
    func fetchGetAccessTokenWithSocialLogin(socialLoginInfo: MemberRequest.SocialLogin) async {
        do {
            try await getAccessTokenWithSocialLogin(socialLoginInfo: socialLoginInfo)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func getAccessTokenWithSocialLogin(socialLoginInfo: MemberRequest.SocialLogin) async throws {
        
        
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
        
        DispatchQueue.main.async { [weak self] in
            do {
                let jsonDictionary = try JSONDecoder().decode(BaseResponse<MemberResponse.GetAccessTokenWithSocialLogin>.self, from: data)
                UserDefaults.standard.set(jsonDictionary.result.memberId, forKey: "memberId")
                UserDefaults.standard.set(jsonDictionary.result.accessToken, forKey: "Authorization")
                UserDefaults.standard.set(jsonDictionary.result.refreshToken, forKey: "refreshToken")
                self?.serviceMember = jsonDictionary.result.serviceMember
                
                print(jsonDictionary.result)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        
    }
}
