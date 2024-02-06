//
//  TILSecondCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//
import SwiftUI

struct TILSecondCell: View {
    @State private var isFileVisible = false
    @StateObject private var fileViewModel = FileAttachmentViewModel()
    var body: some View {
        VStack(spacing: 0) {
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
                    isFileVisible.toggle()
                    fileViewModel.attachFile(name: "file name") // 파일 첨부 시 호출
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

            if isFileVisible {
                TILFile(viewModel: FileAttachmentViewModel())
                    .padding(.top, 8)
            }
        }
    }
}


#Preview {
    TILSecondCell()
}

