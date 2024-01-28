//
//  SideMenuNavigationButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/28/24.
//

import SwiftUI

struct SideMenuNavigationButton<Destination: View>: View {
    var destination: Destination
    var MenuName: String
    var ImageName: String
    @State private var isClicked = false

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
        //네비게이션 페이지 전환
        .navigationDestination(isPresented: $isClicked) {
            //다음 전환하고자 하는 페이지 / 백버튼 안보이게
            destination
                
        }
 
    }
}

extension UINavigationController{
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
