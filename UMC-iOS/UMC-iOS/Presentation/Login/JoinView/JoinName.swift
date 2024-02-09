//
//  JoinName.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/11/24.
//

import SwiftUI

struct JoinName:View {
    @State var name:String = ""
    @State private var isClicked = false
    @Binding var userData: UserData
    
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
                    HStack {
                        Spacer()
                        Button {
                            userData.name = name
                            print(userData)
                            isClicked.toggle()
                        } label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                        .navigationDestination(isPresented: $isClicked) {
                            JoinNickname(userData: $userData)
                        }
                        Spacer().frame(width: 10)
                    }

                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}
