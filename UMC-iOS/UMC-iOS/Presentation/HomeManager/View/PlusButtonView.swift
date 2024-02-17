//
//  PlusButtonView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/17/24.
//

import SwiftUI

struct PlusButtonView: View {
    
    @State var isTapped: Bool = false
    
    var buttonTitle: String = "직책추가"
    
    var body: some View {
        Button {
            
            print("checkButton Tapped.")
            self.isTapped.toggle()
            
        } label: {
            
            HStack(spacing: 4) {
                
                Image("grayPlusButtonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                
                Text(buttonTitle)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .kerning(-1)
                    .foregroundColor(.black)

                
            } // HStack
            
        } // Button
    }
}

#Preview {
    PlusButtonView()
}
