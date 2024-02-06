//UserProfileEditList.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/01/18.
//

import SwiftUI

struct PlaceholderTextEditor: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
            }
            
            TextEditor(text: $text)
                .frame(height: 200)
                .onTapGesture {
                    if text.isEmpty {
                        text = ""
                    }
                }
        }
    }
}

struct UserProfileEditList: View {
    
    @ObservedObject var viewModel: UserProfileEditViewModel
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    
    var body: some View {
        List {
            HStack(spacing: 8) {
                Text("별명")
                    .font(.system(size: 16).bold())
                    .foregroundColor(textColor)
                TextField("더기", text: $viewModel.userNickname)
            }
            HStack(spacing: 8) {
                Text("이름")
                    .font(.system(size: 16).bold())
                    .foregroundColor(textColor)
                TextField("양유진", text: $viewModel.userName)
            }
            VStack {
                Text("상태메세지")
                    .font(.system(size: 16).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(textColor)
                
                PlaceholderTextEditor(text: $viewModel.message, placeholder: "상태메세지를 입력해주세요")
            }
        }
    }
}


struct UserProfileEditList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = UserProfileEditViewModel(userNickname: "더기", userName: "양유진", message: "")
        UserProfileEditList(viewModel: viewModel)
    }
}

