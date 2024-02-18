//
//  InviteAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/18/24.
//

import SwiftUI

struct InviteAPITestView: View {
    @ObservedObject var inviteNetwork = InviteNetwork()
    @State var inviteCode: String = ""
    
    var body: some View {
        VStack {
            TextField("초대코드를 입력하세요.", text: $inviteCode)
            Button {
                Task {
                    await inviteNetwork.fetchVerifyInviteCode(inviteCode: inviteCode)
                }
            } label: {
                Text("초대 코드 확인")
            }
        }
    }
}

#Preview {
    InviteAPITestView()
}
