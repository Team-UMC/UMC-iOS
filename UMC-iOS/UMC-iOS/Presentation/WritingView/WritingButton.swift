//
//  WitingButton.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct WitingButton: View {
    @State var title: String
    @State private var isCompleted = false
    
    var body: some View {
        Button(action: {
            // 클릭 이벤트에 대한 로직을 추가할 수 있습니다.
            // 클릭되었을 때 상태를 변경합니다.
            isCompleted.toggle()
        }) {
            Text(title)
                .font(.system(size: 12))
                .bold()
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .foregroundColor(isCompleted ? Color("searchPurple") : Color("#D1D1D1"))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isCompleted ? Color("searchPurple") : Color("#D1D1D1"), lineWidth: 1.2)
                )
        }
    }
}

struct WitingButton_Previews: PreviewProvider {
    static var previews: some View {
        WitingButton(title: "Click Me")
            .previewLayout(.sizeThatFits)
    }
}

