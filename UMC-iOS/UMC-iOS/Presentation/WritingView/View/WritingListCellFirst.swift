//
//  WritingListCellFirst.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct WritingListCellFirst: View {
    @StateObject private var viewModel =  WritingListCellFirstViewModel()
    var body: some View {
        
        HStack(spacing: 0) {
            Text("첨부파일")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .kerning(-1)
                .foregroundColor(Color.buttonDisabled)
                .padding(.horizontal, 8)
                .padding(.vertical, 5.5)
            
            Spacer()
            
            Button {
                print("iconAddBtn Tapped")
                viewModel.presentFilePicker()
            } label: {
                Image("iconAddButtonImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .padding(8)
            }
        }
        .padding(.horizontal, 16.5)
        .padding(.vertical, 9)
    }
}

struct WritingListCellFirst_Previews: PreviewProvider {
    static var previews: some View {
        WritingListCellFirst()
    }
}

