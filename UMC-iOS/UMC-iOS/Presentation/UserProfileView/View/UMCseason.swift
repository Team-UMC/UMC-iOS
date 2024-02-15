//
//  UMCseason.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

struct UMCSeason: View {
    // Constants
    let profileImage = "profileImage"
    let backgroundColor = Color.white
    let shadowColor = Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.2)
    let textColor = Color(#colorLiteral(red: 0.250980407, green: 0.270588248, blue: 0.4470588276, alpha: 1))
    var semester:String = "FIFTH"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(backgroundColor)
                .frame(width: 78, height: 32)
                .shadow(color: shadowColor, radius: 5)

            HStack(spacing: 6) {
                Image(semester)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)

                Image(semester)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
            }
        }
        .foregroundColor(textColor)
    }
}

#if DEBUG
struct UMCSeason_Previews: PreviewProvider {
    static var previews: some View {
        UMCSeason()
    }
}
#endif

