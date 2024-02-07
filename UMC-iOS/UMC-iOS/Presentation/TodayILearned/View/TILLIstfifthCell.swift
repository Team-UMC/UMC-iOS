//
//  TILLIstfifthCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

struct TILLIstfifthCell: View {
    @StateObject private var viewModel = TILCellViewModel(toDoTitle: "", tilIcon: "", dayAndNight: "", hour: "", minute: "")

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField("소제목",
                          text: $viewModel.TILSubtitle,
                          prompt: Text("소제목")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .kerning(-1)
                            .foregroundColor(Color.buttonDisabled))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6.5)
                    .onChange(of: viewModel.TILSubtitle) { newValue in
                        viewModel.updateSubProjectName(newValue)
                    }
                Spacer()
            } // HStack
        } // VStack
        .padding(.horizontal, 16.5)
        .padding(.vertical, 8)
    }
}

#Preview {
    TILLIstfifthCell()
}


