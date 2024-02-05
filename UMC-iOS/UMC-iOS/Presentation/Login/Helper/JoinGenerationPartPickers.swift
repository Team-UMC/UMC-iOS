//
//  JoinGenerationPartPickers.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI

struct JoinGenerationPartPickers:View {
    @Binding var selection: JoinViewSelectedInfo // 선택 상태 바인딩
    var generations: [String]
    var parts: [String]
    var removeAction: () -> Void
    
    var body: some View {
        HStack {
            DropDownPicker(selection: $selection.selectedGeneration,
                           options: generations,
                           maxWidth: 93,
                           height: 36,
                           minHeight: 150,
                           fontSize: 18,
                           corner: 20,
                           placeholder: "기수",
                           BackColor: .black,
                           TextColor: .white,
                           border: true)
            
            DropDownPicker(selection: $selection.selectedPart,
                           options: parts,
                           maxWidth: 114,
                           height: 36,
                           minHeight: 150,
                           fontSize: 18,
                           corner: 20,
                           placeholder: "파트",
                           BackColor: .black,
                           TextColor: .white,
                           border: true)
            
            Button(action: removeAction) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .foregroundStyle(.gray)
                    .frame(width: 13, height: 13)
                    .padding(6)
            }
        }
    }
}
