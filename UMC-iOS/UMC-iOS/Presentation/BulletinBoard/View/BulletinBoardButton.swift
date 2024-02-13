//
//  BulletinBoardButton.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/08.
//

import SwiftUI

struct BulletinBoardButton: View {
    @State private var showButtons1 = true
    @State private var showButtons2 = false
    @State private var selectedButton1: Int? = 0
    @State private var selectedButton2: Int? = 0
    @State private var isBulletinBoardNoticeVisible = false
    @State private var isSearchUIActive = false
    @State private var isEditingProfile = false
    
    @State private var isClicked = false
    
    var body: some View {
        // FirstButton
        VStack{
            HStack{
                Button("학교") {
                    showButtons1.toggle()
                    showButtons2 = false
                    selectedButton1 = nil
                    isBulletinBoardNoticeVisible = false
                }
                .font(.system(size: 26))
                .bold()
                .foregroundColor(selectedButton1 == 0 ? Color("searchPurple") : Color.gray)
                .padding(.trailing, 20)
                
                Button("지부") {
                    showButtons1 = false
                    showButtons2.toggle()
                    selectedButton1 = 1
                    isBulletinBoardNoticeVisible = false
                }
                .font(.system(size: 26))
                .bold()
                .foregroundColor(selectedButton1 == 1 ? Color("searchPurple") : Color.gray)
                .padding(.trailing, 20)
                
                Button("연합") {
                    showButtons1 = false
                    showButtons2.toggle()
                    selectedButton1 = 2
                    isBulletinBoardNoticeVisible = false
                }
                .font(.system(size: 26))
                .bold()
                .foregroundColor(selectedButton1 == 2 ? Color("searchPurple") : Color.gray)
                .padding(.trailing, 20)
                
                Button("건의함") {
                    showButtons1 = false
                    showButtons2 = false
                    selectedButton1 = 3
                    isBulletinBoardNoticeVisible.toggle()
                }
                .font(.system(size: 26))
                .bold()
                .foregroundColor(selectedButton1 == 3 ? Color("searchPurple") : Color.gray)
                .padding(.trailing, 20)
                
                
                Button(action: {
                    showButtons1 = false
                    showButtons2 = false
                    selectedButton1 = nil
                    isBulletinBoardNoticeVisible = false
                    isSearchUIActive = true
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(selectedButton1 == nil ? Color("searchPurple") : Color.gray)
                }
                .font(.system(size: 26))
                .bold()
                .navigationDestination(isPresented: $isClicked) {
                    BulletinBoardSearchUI()
                }
                .navigationBarBackButtonHidden(true)
                
                Spacer()
            }
            
            // SecondButton
            if showButtons1 {
                ButtonGrid(buttons: ["공지사항", "자유게시판", "질문게시판", "이전기수게시판", "위크북게시판"], selectedButton: $selectedButton2)
            }
            if showButtons2 {
                ButtonGrid(buttons: ["공지사항", "자유게시판", "질문게시판", "이전기수게시판"], selectedButton: $selectedButton2)
            }
            
            if isBulletinBoardNoticeVisible {
                //Spacer()
                BulletinBoardNotice()
            }
        }
        
    }
}

// ButtonGrid
struct ButtonGrid: View {
    var buttons: [String]
    @Binding var selectedButton: Int?
    
    
    var body: some View {
        VStack {
            ForEach(0..<buttons.count / 3 + (buttons.count % 3 == 0 ? 0 : 1)) { rowIndex in
                HStack(alignment: .top) {
                    ForEach(0..<3) { columnIndex in
                        let index = rowIndex * 3 + columnIndex
                        if index < buttons.count {
                            Button(action: {
                                selectedButton = index
                            }) {
                                Text(buttons[index])
                                    .applyButtonStyled(selected: selectedButton == index)
                            }
                            .padding(.bottom, 0)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}



// Extension Name Correction
extension View {
    func applyButtonStyled(selected: Bool) -> some View {
        self
            .font(.system(size: 14))
            .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
            .bold()
            .foregroundColor(selected ? Color("searchPurple") : Color.gray.opacity(0.8))
            .background(selected ? Color("#F0F4FF") : Color.white)
            .cornerRadius(21)
            .frame(width: .infinity, height: 30)
    }
}

// Preview
struct BulletinBoardButton_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoardButton()
    }
}

