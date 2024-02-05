//
//  LoginViewModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI
import Combine
import AuthenticationServices

class LoginViewModel:ObservableObject {
    // MARK: 기타 PROPERTIES
    @Published var isLoggedIn: Bool = false
    @Published var socialToken: Token = Token()
    
    func logout() {
        self.isLoggedIn = false
        self.socialToken = Token()
        print(self.socialToken)
        print("로그아웃 성공(토큰 초기화)")
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
