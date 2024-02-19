//
//  SideMenuNavigationButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI

struct SideMenuNavigationButton<Destination: View>: View {
    var destination: Destination
    var MenuName: String
    var ImageName: String
    @Binding var isClicked: Bool

    var body: some View {
        Button(action: {
            isClicked.toggle()
        }) {
            VStack {
                Image(systemName: ImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                Text(MenuName)
                    .font(.system(size: 10))
                    .foregroundColor(.black)
            }
            .padding(EdgeInsets(top: 4, leading: 10, bottom: 10, trailing: 4))
            
        }
 
    }
}

extension UINavigationController{
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
