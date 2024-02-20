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
            HStack {
                TextField("검색어를 입력하세요", text: $searchText, onCommit: {
                    Task {
                        await BoardNetwork.fetchSearchBoards(keyword: searchText, page: 1)
                    }
                    
                    print("Enter key pressed. Search text: \(searchText)")
                })
                .padding(.top, 20)
                .foregroundColor(Color("textColor"))
                .background(Color(searchColor))
                .cornerRadius(8)
                .padding(.trailing, 8)

                Button("취소") {
                    print("취소버튼을 눌렀습니다")
                    searchText = "" 
                }
                .font(.system(size: 14))
                .padding(.top, 20)
                .foregroundColor(Color("textColor"))
                .background(.clear)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
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
