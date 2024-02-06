//
//  BulletinBoardFirstBtn.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct BulletinBoardFirstBtn: View {
    @State private var selectedButton: Int?
    
    var body: some View {
        NavigationView {
            HStack {
                ButtonView(text: "학교", imageName: nil, index: 1, selectedButton: $selectedButton)
                ButtonView(text: "지부", imageName: nil, index: 2, selectedButton: $selectedButton)
                ButtonView(text: "연합", imageName: nil, index: 3, selectedButton: $selectedButton)
                
                ButtonView(text: "건의함", imageName: nil, index: 4, selectedButton: $selectedButton)
                
                NavigationLink( destination:BulletinBoardSearchUI()){
                    ButtonView(text: nil, imageName: "magnifyingglass", index: 5, selectedButton: $selectedButton)
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct ButtonView: View {
    let text: String?
    let imageName: String?
    let index: Int
    @Binding var selectedButton: Int?
    
    var body: some View {
        Button(action: {
            selectedButton = index
        }) {
            HStack {
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .font(.system(size: 26))
                        .padding(8)
                        .applyButtonStyle(selected: selectedButton == index)
                }
                if let text = text {
                    Text(text)
                        .padding(8)
                        .applyButtonStyle(selected: selectedButton == index)
                }
            }
        }
    }
}

extension View {
    func applyButtonStyle(selected: Bool) -> some View {
        self
            .font(.system(size: 26))
            .bold()
            .foregroundColor(selected ? Color(red: 135/255, green: 132/255, blue: 255/255) : Color(red: 0xBC/255, green: 0xBC/255, blue: 0xBC/255))
    }
}

struct BulletinBoardFirstBtn_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoardFirstBtn()
    }
}
