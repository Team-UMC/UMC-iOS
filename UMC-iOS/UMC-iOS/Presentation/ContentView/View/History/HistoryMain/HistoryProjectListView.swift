//
//  HistoryProjectListView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/29.
//

import SwiftUI

struct HistoryProjectListView: View {
    var body: some View {
        VStack(spacing: 24) {
            
            ForEach(0..<5) { index in
                HStack(spacing: 14) {
                    ForEach(0..<2) { index in
                        HistoryProjectView()
                    } // ForEach
                } // HStack
            }
        } // VStack
        .padding(.horizontal, 16)
    }
}

#Preview {
    HistoryProjectListView()
}
