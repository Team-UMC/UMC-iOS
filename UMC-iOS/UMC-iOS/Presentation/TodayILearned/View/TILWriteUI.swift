//
//  TILWriteUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct TILWriteUI: View {
    @State var title: String
    @State var subtitle: String
    @State var content: String
    var body: some View {
        VStack{
            TILNavigationbar()
                .padding(.bottom,16)
            
            //list1
             TILListFirstCell()
             TILListFirstViewsub()
            Divider()
                .frame(width:350,height: 1)
            //list2
            TILSecondCell()
            Divider()
                .frame(width:350,height: 1)
            // list3
            TILListThirdCell()
            Divider()
                .frame(width:350,height: 1)
            // list4
            TILListFourthCell()
            Divider()
                .frame(width:350,height: 1)
            // list5
            TILLIstfifthCell()
            Divider()
                .frame(width:350,height: 1)
            // list6
            TILListSixthCell()
            Divider()
                .frame(width:350,height: 1)
        Spacer()
        }
    }
}

#Preview {
    TILWriteUI(title: "", subtitle: "", content: " ")
}

