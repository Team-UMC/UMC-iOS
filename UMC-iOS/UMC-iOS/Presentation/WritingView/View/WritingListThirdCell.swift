//
//  WritingListThirdCell.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/05.
//

import SwiftUI

struct WritingListThirdCell: View {
    @StateObject private var viewModel = WritingListThirdCellViewModel()
    
    var body: some View {
        VStack(alignment:.trailing, spacing:0) {
            HStack(spacing: 0) {
                TextField("내용",
                          text: $viewModel.writingContent,
                          prompt: Text("내용을 입력해주세요.")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .kerning(-1)
                            .foregroundColor(Color.buttonDisabled))
                    .frame(width: .infinity, height: 150, alignment: .topLeading)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 7.5)
            }
        }
        .padding(.horizontal, 16.5)
        .padding(.vertical, 8)
    }
}

#Preview {
    WritingListThirdCell()
}
