//
//  ToDoListNavigationbar.swift
//  vedio
//
//  Created by 나예은 on 2024/02/08.
//

import SwiftUI

struct ToDoListNavigationbar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label : {
                Image("backImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    .padding(10)
            }
            
            Spacer()
            
            Text("ToDo-List")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .kerning(-1)
                .offset(x: 0)
            
            Spacer()
            
            Button(action: {
                print("완료 버튼")
            }) {
                Text("완료")
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
    ToDoListNavigationbar()
}



