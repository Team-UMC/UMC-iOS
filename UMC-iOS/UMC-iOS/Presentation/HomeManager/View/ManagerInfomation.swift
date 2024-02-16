//
//  ManagerInfomation.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct ManagerInfomation: View {
    
    @State var nameAndNickname: String = ""
    
    var body: some View {
        ZStack {
            
            Color.textfieldBack.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // Search Bar
                ManagerInfoSearchBar(nameAndNickname: $nameAndNickname)
                
                ManagerInfoSelect()
                
            } // VStack
            
        } // ZStack
    }
}

#Preview {
    ManagerInfomation()
}
