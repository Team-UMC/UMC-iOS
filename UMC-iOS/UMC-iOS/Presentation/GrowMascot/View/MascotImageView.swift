//
//  MascotImageView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2/15/24.
//

import SwiftUI

struct MascotImageView: View {
    
    var mascotImageName: String = ""
    
    var body: some View {
        Image(mascotImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 178, height: 178)
    }
}

#Preview {
    MascotImageView()
}
