//
//  UMC_iOSApp.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct UMC_iOSApp: App {
    @StateObject var socialLoginViewModel = SocialLoginViewModel()
    @StateObject var loginViewModel = LoginViewModel()
    
    init(){
        // 메인번들에 있는 카카오 앱키 불러오기
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        
        print(kakaoAppKey)
        
        // kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
    }

    var body: some Scene {
        WindowGroup {
            ApiTestView()
                .onOpenURL(perform: { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                })
                .environmentObject(socialLoginViewModel)
                .environmentObject(loginViewModel)
        }
        .environmentObject(socialLoginViewModel)
        .environmentObject(loginViewModel)
    }
}
