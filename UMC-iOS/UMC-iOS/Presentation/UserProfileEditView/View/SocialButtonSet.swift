//
//  SocialButtonSet.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/2/24.
//

import SwiftUI

struct SocialButtonSet: View {
    @State private var isFriendAdded: Bool = false
   // var SocialimageName: String
    var profileImage = "profileImage"
    var textColor = UIColor(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1)
    
    var body: some View {
        HStack(spacing: 30) {
            
            // 친구 추가 & 삭제
            HStack {
                if isFriendAdded == false {
                    Button(action: {
                        isFriendAdded.toggle()
                        
                    }) {
                        VStack{
                            Image("User_Add")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .padding(.trailing,20)
                        }
                    }
                } else {
                    Button(action: {
                        isFriendAdded.toggle()
                        
                    }) {
                        VStack{
                            Image("User_Del")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .padding(.trailing,20)
                        }
                    }
                }
                    // 쪽지 보내기
                    VStack {
                        Button(action: {
                        }) {
                            VStack{
                                Image("User_Mail")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)

                            }
                        }
                    }
                }
            }
        .padding(EdgeInsets(top: 32, leading: 0, bottom: 16, trailing: 0))
        }
    }
        struct SocialButtonSet_Previews: PreviewProvider {
            static var previews: some View {
                SocialButtonSet()
            }
        }
    
