//  UserProfileEditImage.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI

struct UserProfileEditImage: View {
    @StateObject private var viewModel = UserProfileEditImageViewModel()
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    
    var body: some View {
        ZStack {
            if let selectedImage = viewModel.selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    .background(Color.clear)
                    .padding(.bottom, 20)
                    .padding(.top, 8)
            } else {
                Image("profileImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    .background(Color.clear)
                    .padding(.bottom, 20)
                    .padding(.top, 8)
            }

            Button(action: {
                viewModel.pickImage()
            }) {
                Image(systemName: "camera.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .padding(8)
                    .background(Color(viewModel.selectedImage != nil ? .clear : .blue))
                    .clipShape(Circle())
                    .offset(x: 40, y: 38)
            }
        }
        .onAppear {
            
        }
    }
}

#Preview {
    UserProfileEditImage()
}

