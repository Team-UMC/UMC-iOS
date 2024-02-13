//
//  TILNavigationbar.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

struct TILNavigationbar: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
               HStack(spacing: 0) { // navigation bar

                   // X Button
                   Button {
                       print("navigation bar - X Button Tapped")
                       presentationMode.wrappedValue.dismiss()
                   } label : {
                       Image("xButtonImage")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 22, height: 22)
                           .padding(10)
                   } // XButton

                   Spacer()

                   Text("TIL")
                       .font(.system(size: 18))
                       .fontWeight(.semibold)
                       .kerning(-1)
                       .offset(x: 0)

                   Spacer()

                   // 게시 Button
                   Button {
                       print("navigation bar - register Button Tapped")
                   } label: {
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

               } // HStack (navigation bar)
               .padding(.horizontal, 18)
           }
       }
    


#Preview {
    TILNavigationbar()
}

