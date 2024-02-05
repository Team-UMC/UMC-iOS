//
//  WritingListCellFirst.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct WritingListCellFirst: View {
    var body: some View {
        HStack{
            ButtonWithIcon(title: "학교", icon: "school")
            ButtonWithIcon(title: "학교", icon: "school")
            ButtonWithIcon(title: "학교", icon: "school")
            ButtonWithIcon(title: "학교", icon: "school")
        }
    }
}

#Preview {
    WritingListCellFirst()
}

