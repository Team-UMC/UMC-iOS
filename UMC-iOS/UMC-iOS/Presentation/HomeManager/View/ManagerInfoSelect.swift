//
//  ManagerInfoSelect.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct ManagerInfoSelect: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("운영진 직책")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .kerning(-1)
            
            Text("학교")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .kerning(-1)
                .foregroundColor(Color.tdlGray)
            
            
        } // VStack
    }
}

#Preview {
    ManagerInfoSelect()
}
