//
//  DetailNavigationBar.swift
//  vedio
//
//  Created by 나예은 on 2024/02/07.
//

import SwiftUI

struct DetailNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label : {
                Image("xButtonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    .padding(10)
            }
            
            Spacer()
            
            Text("TIL")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .kerning(-1)
                .offset(x: 0)
            
            Spacer()
            
            Button(action: {
                print("글쓰기 게시 버튼")
            }) {
                Text("게시")
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .frame(height: 22)
                    .foregroundColor(Color.disabledGray)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color.historyPurple)
                    .cornerRadius(12.0)
                    .padding(.vertical, 6)
            }
        }
        .padding(.horizontal, 18)
        
    }
}


#Preview {
    DetailNavigationBar()
}


