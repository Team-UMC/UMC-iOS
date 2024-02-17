//
//  ManagerInfoSelect.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct ManagerInfoSelect: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("운영진 직책")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .kerning(-1)
            
            Text("학교")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .kerning(-1)
                .foregroundColor(Color.tdlGray)
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                // 회장, 부회장, 운영국장, PM파트장
                HStack(spacing: 8) {
                    
                    CheckButtonView(buttonTitle: "회장")
                    CheckButtonView(buttonTitle: "부회장")
                    CheckButtonView(buttonTitle: "운영국장")
                    CheckButtonView(buttonTitle: "PM 파트장")
                    
                } // HStack
                
                // Design파트장, Spring파트장, Node파트장
                HStack(spacing: 8) {
                    
                    CheckButtonView(buttonTitle: "Design 파트장")
                    CheckButtonView(buttonTitle: "Spring 파트장")
                    CheckButtonView(buttonTitle: "Node 파트장")
                    
                } // HStack
                
                HStack(spacing: 8) {
                    
                    CheckButtonView(buttonTitle: "Web 파트장")
                    CheckButtonView(buttonTitle: "iOS 파트장")
                    CheckButtonView(buttonTitle: "Android 파트장")
                    
                }
                
                PlusButtonView()
                
            }
            
            Text("중앙")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .kerning(-1)
                .foregroundColor(Color.tdlGray)
                .padding(.top, 8)
            
            
            VStack(alignment: .leading, spacing: 16) {
                
                // 회장, 부회장, 운영국장, PM파트장
                HStack(spacing: 8) {
                    
                    CheckButtonView(buttonTitle: "회장")
                    CheckButtonView(buttonTitle: "부회장")
                    CheckButtonView(buttonTitle: "운영국장")
                    CheckButtonView(buttonTitle: "PM 파트장")
                    
                } // HStack
                
                // Design파트장, Spring파트장, Node파트장
                HStack(spacing: 8) {
                    
                    CheckButtonView(buttonTitle: "Design 파트장")
                    CheckButtonView(buttonTitle: "Spring 파트장")
                    CheckButtonView(buttonTitle: "Node 파트장")
                    
                } // HStack
                
                HStack(spacing: 8) {
                    
                    CheckButtonView(buttonTitle: "Web 파트장")
                    CheckButtonView(buttonTitle: "iOS 파트장")
                    CheckButtonView(buttonTitle: "Android 파트장")
                    
                }
                
                PlusButtonView()
                
            }
            
            Divider()
                .foregroundColor(.settingDivider)
                .padding(.top, 4)
            
            Text("기수 및 파트")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .kerning(-1)
                .foregroundColor(.black)
            
            CardinalNumberPartView()
            
        } // VStack
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    ManagerInfoSelect()
}
