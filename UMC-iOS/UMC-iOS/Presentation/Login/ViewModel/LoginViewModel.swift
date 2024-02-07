//
//  LoginViewModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI
import Combine
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices

class LoginViewModel:ObservableObject {
    // MARK: 카카오 로그인 관련 PROPERTIES
    @Published var kakaoUser: KakaoSDKUser.User?
    @Published var kakaoToken:  OAuthToken?
    
    // MARK: 기타 PROPERTIES
    @Published var isLoggedIn: Bool = false
    @Published var socialToken: Token = Token()
    
    func logout() {
        self.isLoggedIn = false
        self.socialToken = Token()
        print(self.socialToken)
        print("로그아웃 성공(토큰 초기화)")
    }
    
    // MARK: 카카오 로그인 관련 FUNCTIONS
    func kakaoLogin(UMCUser: User, completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        if UserApi.isKakaoTalkLoginAvailable() {
            dispatchGroup.enter()
            handleLoginWithKakaoTalkApp {
                self.setUserInfo(UMCUser: UMCUser) {
                    self.getSocialTokenForKakao()
                    dispatchGroup.leave()
                }
            }
        } else {
            dispatchGroup.enter()
            handleLoginWithKakaoAccount() {
                self.setUserInfo(UMCUser: UMCUser) {
                    self.getSocialTokenForKakao()
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
    
    func handleLoginWithKakaoTalkApp(completion: @escaping () -> Void) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    self.kakaoToken = oauthToken
                    self.isLoggedIn = true
                    completion()
                }
            }
        }
    }
    
    func handleLoginWithKakaoAccount(completion: @escaping () -> Void) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                //do something
                self.kakaoToken = oauthToken
                self.isLoggedIn = true
                completion()
            }
        }
    }
    
    func handleKakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                self.kakaoUser = nil
                self.isLoggedIn = false
            }
        }
    }
    func setUserInfo(UMCUser: User, completion: @escaping () -> Void) {
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            }
            else {
                if let user = user {
                    var scopes = [String]()
                    if (user.kakaoAccount?.profileNeedsAgreement == true) { scopes.append("profile") }
                    if (user.kakaoAccount?.emailNeedsAgreement == true) { scopes.append("account_email") }
                    if (user.kakaoAccount?.birthdayNeedsAgreement == true) { scopes.append("birthday") }
                    if (user.kakaoAccount?.birthyearNeedsAgreement == true) { scopes.append("birthyear") }
                    if (user.kakaoAccount?.genderNeedsAgreement == true) { scopes.append("gender") }
                    if (user.kakaoAccount?.phoneNumberNeedsAgreement == true) { scopes.append("phone_number") }
                    if (user.kakaoAccount?.ageRangeNeedsAgreement == true) { scopes.append("age_range") }
                    if (user.kakaoAccount?.ciNeedsAgreement == true) { scopes.append("account_ci") }
                    
                    if scopes.count > 0 {
                        print("사용자에게 추가 동의를 받아야 합니다.")
                        UserApi.shared.loginWithKakaoAccount(scopes: scopes) { (_, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                UserApi.shared.me() { (user, error) in
                                    if let error = error {
                                        print(error)
                                    }
                                    else {
                                        print("me() success.")
                                        
                                        //do something
                                        _ = user
                                    }
                                }
                            }
                        }
                    }
                    else {
                        print("사용자의 추가 동의가 필요하지 않습니다.")
                    }
                }
            }
            completion()
        }
    }
    
    func getSocialTokenForKakao() {
        DispatchQueue.main.async { [weak self] in
            guard let socialToken = self?.kakaoToken else {
                print("카카오 소셜 로그인 토큰이 정상적으로 발급되지 않았습니다.")
                return
            }
            self?.socialToken = Token(authProvider: "KAKAO", accessToken: socialToken.accessToken)
            print("[Kakao token test log]\(self?.socialToken)")
        }
    }
    
    // MARK: 애플 로그인 관련 FUNCTIONS
    func appleLoginButton(completion: @escaping () -> Void) -> some View {
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Apple Login Successful")
                    switch authResults.credential{
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                        let UserIdentifier = appleIDCredential.user
                        let fullName = appleIDCredential.fullName
                        let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                        let email = appleIDCredential.email
                        let IdentityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                        let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.socialToken = Token(authProvider: "APPLE", accessToken: IdentityToken!, authorizationCode: AuthorizationCode!)
                            self?.isLoggedIn = true
                            completion()
                        }
                    default:
                        break
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
                }
            }
        )
        .frame(width: 272, height: 44)
        .cornerRadius(12)
    }
}

//extension UIApplication {
//    func rootController() -> UIViewController {
//        guard let window = connectedScenes.first as? UIWindowScene else { return .init() }
//        guard let viewController = window.windows.last?.rootViewController else { return .init() }
//        return viewController
//    }
//}
