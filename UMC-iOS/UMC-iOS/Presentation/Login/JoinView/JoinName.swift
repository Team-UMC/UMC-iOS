//
//  JoinName.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/11/24.
//

import SwiftUI

struct JoinName:View {
    @State var name:String = ""
    
    var body: some View {
        ZStack{
            Image("signup_background")
                .resizable()
            
            VStack {
                Spacer().frame(height: 140)
                
                VStack{
                    
                    Text("이름을 입력해주세요")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Spacer().frame(height: 16)
                    
                    TextField("", text: $name,
                              prompt: Text("이름을 입력해주세요")
                        .foregroundColor(.black.opacity(0.5))
                    )
                    .modifier(JoinTextFieldStyle())
                }
                .padding()
                
                Spacer().frame(height: 373)
                
                if (!name.isEmpty){
                    JoinNavigationButton(destination: JoinNickname())
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}
