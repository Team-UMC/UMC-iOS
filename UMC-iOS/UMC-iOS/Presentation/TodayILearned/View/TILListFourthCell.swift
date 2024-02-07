//
//  TILListFourthCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI

struct TILListFourthCell: View {
    @State private var projectName: String = ""
    @StateObject private var viewModel = TILCellViewModel(toDoTitle: "", tilIcon: "", dayAndNight: "", hour: "", minute: "")
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField("제목",
                          text: $viewModel.TILTiltle,
                          prompt: Text("제목")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .kerning(-1)
                    .foregroundColor(Color.buttonDisabled))
                .padding(.horizontal, 8)
                .padding(.vertical, 6.5)
                .onChange(of: viewModel.TILTiltle) { newValue in
                    viewModel.updateTitle(newValue)
                }
                
                Spacer()
            } // HStack
        } // VStack
        .padding(.horizontal, 16.5)
        .padding(.vertical, 8)
    }
}

#Preview {
    TILListFourthCell()
}

