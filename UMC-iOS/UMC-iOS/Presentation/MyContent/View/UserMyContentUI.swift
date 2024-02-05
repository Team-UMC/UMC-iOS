//
//  UserMyContentUI.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/28.
//

import SwiftUI

struct UserMyContentUI: View {
    
    @State private var searchText = ""
    @State private var searchColor = "barSecond"
    
    var body: some View {
        VStack{
            HStack{
                SearchBar(text: $searchText, color: $searchColor)
                    .padding(.top, 20)
                    .onTapGesture {
                        hideKeyboard()
                    }
                Button(action: {
                    
                }) {
                     Text("취소")
                        .padding(.top, 20)
                        .foregroundColor(.black)
                }
            }
            MyContentList()
                .padding(.leading,20)
                .padding(.trailing,20)
                
        }
        .background(Color("searchbar"))
    }
       
}

#Preview {
    UserMyContentUI()
}
