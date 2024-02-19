//
//  ProfileNavigationbar.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/19.
//

import SwiftUI

struct ProfileNavigationbar: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack(spacing: 0) { // navigation bar
            
            // X Button
            Button {
                presentationMode.wrappedValue.dismiss()
                print("navigation bar - < Button Tapped")
            } label : {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    .padding(10)
                    .foregroundColor(.white)
            } // XButton
            
            Spacer()
            
            Text("프로필 수정")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .kerning(-1)
                .offset(x: 0)
                .foregroundColor(.white)
                .padding(.trailing,30)
            
            Spacer()
            
            
        } // HStack (navigation bar)
        .padding(.horizontal, 18)
    }
}



#Preview {
    ProfileNavigationbar()
}

