//
//  RankingNavigationbar.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/15.
//

import SwiftUI

struct RankingNavigationbar: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
               HStack(spacing: 0) { // navigation bar

                   Button {
                       print("navigation bar - < Button Tapped")
                       presentationMode.wrappedValue.dismiss()
                   } label : {
                       Image(systemName: "chevron.left")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 22, height: 22)
                           .padding(10)
                           .foregroundStyle(.white)
                   }

                   Spacer()

                   Text("랭킹")
                       .font(.system(size: 18))
                       .fontWeight(.bold)
                       .foregroundStyle(.white)
                       .kerning(-1)
                       .offset(x: 0)
                       .padding(.trailing,30)

                   Spacer()

                   
               } // HStack (navigation bar)
               .padding(.horizontal, 18)
           }
       }

#Preview {
    RankingDetailView()
    //RankingNavigationbar()
}
