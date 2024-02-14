//
//  GrowMascotView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct GrowMascotView: View {
    var body: some View {
        ZStack {
            
            // 배경
            Color.black.ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                
                
                HStack(spacing: 0) {
                    
                    UniversityExpView()
                    
                    Spacer()
                    
                    UniversityRankButtonView()
                    MyContributionButtonView()
                    
                } // HStack
                
            } // VStack
            
        } // ZStack
    }
}

#Preview {
    GrowMascotView()
}
