//
//  SettingPageNavigation.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/19.
//

import SwiftUI

struct SettingPageNavigation: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
               HStack(spacing: 0) { // navigation bar

                   // < Button
                   Button {
                       print("navigation bar - X Button Tapped")
                       presentationMode.wrappedValue.dismiss()
                   } label : {
                       Image("backImage")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 22, height: 22)
                           .padding(10)
                   } // < Button

                   Spacer()

                   Text("설정")
                       .font(.system(size: 24))
                       .fontWeight(.semibold)
                       .kerning(-1)
                       .offset(x: 0)
                       .padding(.trailing,30)

                   Spacer()
                   

               } // HStack (navigation bar)
               .padding(.horizontal, 18)
           }
    
       }
    


#Preview {
    SettingPageNavigation()
}

