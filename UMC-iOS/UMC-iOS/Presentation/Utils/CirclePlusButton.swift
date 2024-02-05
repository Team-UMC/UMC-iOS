//
//  CirclePlusButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/23/24.
//

import SwiftUI

struct CirclePlusButton:View {
    @State var plusChecked: Bool = false
    var title: String
    var ImageSize: CGFloat = 18
    var leftText: Bool = false
    var fillPlus: Bool = false
    var TextColor: Color = .black
    var iconColor: Color = Color(.lightGray)
    
    var body: some View{
        Button(action: {
            plusChecked.toggle()
            print(title)
        }, label: {
            HStack(spacing:4){
                if !leftText{
                    Image(systemName: fillPlus ? "plus.circle.fill" : "plus.circle")
                        .font(.system(size: ImageSize))
                        .frame(width: 20, height: 20)
                        .foregroundStyle(iconColor)
                }
                
                Text(title)
                    .foregroundStyle(TextColor)
                    .font(.system(size: 14))
                
                if leftText{
                    Image(systemName: fillPlus ? "plus.circle.fill" : "plus.circle")
                        .font(.system(size: ImageSize))
                        .frame(width: 20, height: 20)
                        .foregroundStyle(iconColor)
                }
            }
        })



    }
}
