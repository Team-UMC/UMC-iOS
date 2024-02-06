//  UserProfileUI.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI

struct UserProfileUI: View {
    var profileImage = "profileImage"
    var backgroundColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))

    var body: some View {
        ZStack {
            // Background
            Image("backgroundImage_2")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

            VStack {
                UserProfile() // Photo and university label

                HStack(spacing: 8) {
                    AbleStack() // Technical skills
                    UMCSeason() // UMC season
                }

                UserMessage() // Status message and buttons
            }
            .padding(.bottom, 60)
        }
        .background(backgroundColor)
    }
}

#if DEBUG
struct UserProfileUI_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileUI()
    }
}
#endif

