//
//  TILListThirdCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

struct TILListThirdCell: View {
    @StateObject private var notionViewModel = NotionIntegrationViewModel()

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("노션 연동")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .kerning(-1)
                    .foregroundColor(Color.buttonDisabled)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5.5)

                Spacer()

                Button {
                    print("Notion integration Tapped")
                    notionViewModel.integrateNotion()
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

            if notionViewModel.isNotionIntegrated {
                TILFileView(viewModel: notionViewModel)
                    .padding(.top, 8)
            }
        }
    }
}

struct TILFileView: View {
    @ObservedObject var viewModel: NotionIntegrationViewModel

    var body: some View {
        TILFile(viewModel: FileAttachmentViewModel())
    }
}

#Preview {
    TILListThirdCell()
}


