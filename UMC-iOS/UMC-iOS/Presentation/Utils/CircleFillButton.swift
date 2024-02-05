//
//  CircleFillButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/22/24.
//

import SwiftUI

struct CircleFillButton: View {
    var title: String
    @State var isChecked: Bool = false
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {
                Text(title)
                    .foregroundStyle(isChecked ? .main : Color(.lightGray))
                    .font(.system(size: 16))
                
                if isChecked {
                    ZStack{
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.main)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(.main)
                    }
                } else{
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color(.lightGray))
                }
            }
        }
    }
}

