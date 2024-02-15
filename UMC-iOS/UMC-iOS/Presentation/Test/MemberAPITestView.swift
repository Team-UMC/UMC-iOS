//
//  MemberAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/15/24.
//

import SwiftUI

struct MemberAPITestView: View {
    @ObservedObject var memberNetwork = MemberNetwork()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await memberNetwork.fetchDeleteMember()
                }
            } label: {
                Text("멤버 탈퇴")
            }
        }
    }
}

#Preview {
    MemberAPITestView()
}
