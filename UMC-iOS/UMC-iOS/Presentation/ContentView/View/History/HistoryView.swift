//
//  HistoryView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/28.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                Image("historyBackgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                    // .position(x: UIScreen.main.bounds.width/2, y: 832)
                    .offset(x: 0, y: 0)
                
                VStack(spacing: 0) {
                    HotProjectView()
                        .padding(.top, 84)
                    HistorySearchBarView()
                        .padding(.top, 32)
                    
                    Spacer()
                        
                }
                    
            } // ZStack
            .background(Color.red)
        } // ScrollView
        .ignoresSafeArea(.all)
    }
}

#Preview {
    HistoryView()
}
