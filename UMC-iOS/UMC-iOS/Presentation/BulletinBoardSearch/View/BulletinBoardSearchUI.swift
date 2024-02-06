//
//  BulletinBoardSearchUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct BulletinBoardSearchUI: View {
    @State private var searchText = ""
    @State private var searchColor = "searchbar"
    var body: some View {
        VStack {
            HStack{
                SearchBar(text: $searchText, color: $searchColor)
                    .padding(.top, 20)
                    .onTapGesture {
                        hideKeyboard()
                    }
                Button("취소") {
                    print("취소버튼을 눌렀습니다")
                }
                .font(.system(size: 14))
                .padding(.top, 20)
                .padding(.leading,8)
                .foregroundColor(Color("textColor"))
                .background(.clear)
            }
            Spacer()
        }
    }
}

struct BulletinBoardSearchUI_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoardSearchUI()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
