//
//  DetailButton.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/3/24.
//

import SwiftUI

struct DetailButton: View {
    var body: some View {
        HStack{
            Button(action: {

            }) {
                HStack(spacing: 8) {
                    Image("LikeIconGray")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10, height: 10)

                    Text("좋아요")
                        .font(.system(size: 10))
                        .foregroundColor(Color("#999999"))

                }
                .padding(6)
                .background(Color("#F6F6F6"))
                .cornerRadius(8)
            }
                Button(action: {

                }) {
                    HStack{
                        HStack(spacing: 8) {
                            Image("messageIconGray")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)

                            Text("댓글")
                                .font(.system(size: 10))
                                .foregroundColor(Color("#999999"))

                        }
                        .padding(6)
                        .background(Color("#F6F6F6"))
                        .cornerRadius(8)
                    }
                }

            }
        }

    }


#Preview {
    DetailButton()
}
