//
//  ApiTestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/8/24.
//

import SwiftUI

struct ApiTestView: View {
    @ObservedObject var userProfileViewModel = UserProfileViewModel()
    
    var body: some View {
        Button {
            Task {
                await userProfileViewModel.fetchGetUserProfile()
            }
        } label: {
            Text("UserProfileViewModel.")
        }
    }
}

#Preview {
    ApiTestView()
}
