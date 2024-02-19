//  UserProfileUI.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI

struct UserProfileUI: View {
    @State private var isClicked = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isEditingProfile = false
    var memberProfile: MemberResponse.GetMemberProfile

    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Image("backgroundImage_2")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

                VStack {
                    UserProfile(memberInfo: memberProfile) // Photo and university label
                    
                    HStack(spacing: 8) {
                        ProfileParts(memberParts: memberProfile.semesterParts) // Technical skills
                        UMCSeason(member: Member()) // UMC season
                    }
                    
                    UserMessage() // Status message and buttons
                        .padding(.top,70)
                        .padding(.bottom,30)
                    

                    Button(action: {
                        print("수정하기 버튼")
                        isClicked.toggle()
                    }) {
                        Text("수정하기")
                            .font(.system(size: 16, weight: .black))
                            .padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16))
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(17.5)
                            .shadow(radius: 10)
                    }
                }
                .padding(.bottom, 60)
            }
            .background(.white)
        }
    }
}

// Remaining code remains the same


#if DEBUG
struct UserProfileUI_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileUI(memberProfile: MemberResponse.GetMemberProfile())
    }
}
#endif



