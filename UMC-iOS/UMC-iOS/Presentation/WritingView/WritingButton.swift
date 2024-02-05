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

            isCompleted.toggle()
        }) {
            Text(title)
                .font(.system(size: 12))
                .bold()
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .foregroundColor(isCompleted ? Color.historyPurple : Color.historyDisabledGray)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isCompleted ? Color.historyPurple : Color.historyDisabledGray)
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

