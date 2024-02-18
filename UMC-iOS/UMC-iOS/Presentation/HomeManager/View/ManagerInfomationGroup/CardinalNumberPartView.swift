//
//  CardinalNumberPartView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/17/24.
//

import SwiftUI

struct CardinalNumberPartView: View {
    
    @State var shoudShowMySelf: Bool = true
    @State var selectedGeneration: String = ""
    @State var selectedPart: String = ""
    
    let Generations = ["1기", "2기", "3기", "4기", "5기", "6기"]
    let Parts = ["PM", "Design", "Spring", "Node", "Web", "iOS", "Android"]
    
    var body: some View {
        
        HStack(spacing: 4) {
            
            Button {
                
                print("delete button Tapped")
                
            } label: {
                
                Image("grayDeleteButtonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                    .padding(4)
                
            } // Button
            
            DropDownPicker(selection: $selectedGeneration,
                           options: Generations,
                           maxWidth: 91,
                           height: 29,
                           minHeight: 150,
                           fontSize: 14,
                           placeholder: "기수",
                           BackColor: .energy,
                           TextColor: .main,
                           border: false)
            
            DropDownPicker(selection: $selectedPart,
                           options: Parts,
                           maxWidth: 114,
                           height: 29,
                           minHeight: 150,
                           fontSize: 14,
                           placeholder: "파트",
                           BackColor: .energy,
                           TextColor: .main,
                           border: false)
            
            Button {
                
            } label: {
                
                HStack(spacing: 4) {
                    
                    Text("추가")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .kerning(-1)
                        .foregroundColor(.main)
                    
                    Image("purplePlusButtonImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14)
                    
                } // HStack
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .background(Color.hashtagAbledBackground)
                .cornerRadius(12)
                
            } // Button
            
        } // HStack
        
    }
}

#Preview {
    CardinalNumberPartView()
}
