//
//  CustomerService.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/19.
//

import SwiftUI

struct CustomerService: View {
    var body: some View {
        
        List{
            Section{
                Text("고객센터")
                    .font(.system(size: 20))
                    .bold()
                    
                Button(action: {
                }) {
                    Text("자주 묻는 질문")
                        .font(.system(size: 18))
                }
                Button(action: {
                }) {
                    Text("개발자에게 피드백 보내기")
                        .font(.system(size: 18))
                }
            }//Section
            
            Section{
                Text("앱정보")
                    .font(.system(size: 20))
                    .bold()
                Button(action: {
                }) {
                    Text("이용약관")
                        .font(.system(size: 18))
                }
                Button(action: {
                }) {
                    Text("개인정보 처리 방침")
                        .font(.system(size: 18))
                }
                Button(action: {
                }) {
                    Text("버전 정보")
                        .font(.system(size: 18))
                }
            }//Section
            
            Section{
                Text("UMC")
                    .font(.system(size: 20))
                    .bold()
                Button(action: {
                }) {
                    Text("UMC 인스타그램")
                        .font(.system(size: 18))
                }
            }//Section
            
            Section{
                Text("기타")
                    .font(.system(size: 20))
                    .bold()
                Button(action: {
                }) {
                    Text("로그아웃")
                        .font(.system(size: 18))
                }
                Button(action: {
                }) {
                    Text("탈퇴하기")
                        .font(.system(size: 18))
                }
            }//Section
            
        }//List
        .scrollContentBackground(.hidden)
        .background(.white)
        .foregroundColor(Color("textColor"))
        
    }
}
                    
#Preview {
    CustomerService()
}
