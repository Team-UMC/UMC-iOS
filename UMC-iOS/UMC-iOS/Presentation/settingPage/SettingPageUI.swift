//
//  SettingPageUI.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/19.
//

import SwiftUI

struct SettingPageUI: View {
    var body: some View {
        VStack{
            SettingPageNavigation()
                .padding(.top,20)
                .padding(.bottom,-10)
            
            CustomerService()
                .padding(.leading,-10)
        }//Vstack
        .background(.white)
    }
}

#Preview {
    SettingPageUI()
}
