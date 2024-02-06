//
//  UMC_iOSApp.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import SwiftUI

@main
struct UMC_iOSApp: App {
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var userViewModel = UserViewModel()
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
        .environmentObject(loginViewModel)
        .environmentObject(userViewModel)
    }
}
