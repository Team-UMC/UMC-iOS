//
//  AppleLoginButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI

struct AppleLoginButton: View {
    @EnvironmentObject var socialLoginViewModel: SocialLoginViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    @Binding var isLoggedIn: Bool
    @Binding var alreadyMember: Bool
    
    var body: some View {
        socialLoginViewModel.appleLoginButton() {
            if socialLoginViewModel.isLoggedIn {
                loginViewModel.joinMember(socialToken: socialLoginViewModel.socialToken) {alreadyMember = loginViewModel.serviceMember
                    isLoggedIn = true
                }
            } else {
                isLoggedIn = false
            }
        }
    }
}
