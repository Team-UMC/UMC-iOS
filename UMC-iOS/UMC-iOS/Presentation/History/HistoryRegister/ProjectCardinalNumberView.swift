//
//  ProjectCardinalNumberView.swift
//  UMC-iOS
//
//  Created by 김승원 on 2024/01/30.
//

import SwiftUI

struct ProjectCardinalNumberView: View {
    
    @State private var selectedID: Int?
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<6) { index in
                RadioButton(title: "\(index + 1)",
                            id: index,
                            isSelected: selectedID == index) { id in
                    if selectedID == id {
                        selectedID = nil
                    } else {
                        selectedID = id
                    }
                }
            } // ForEach
            
            Spacer()
            
        } // HStack
        .padding(.horizontal, 16.5)
        .padding(.vertical, 10)
    }
}

struct RadioButton: View {
    let title: String
    let id: Int
    let isSelected: Bool
    let action: (Int) -> Void
    
    var body: some View {
        Button {
            print("\(title)기 Btn Tapped")
            action(id)
        } label: {
            Text("\(title)기")
            .font(.system(size: 12))
            .fontWeight(.semibold)
            .kerning(-0.84)
            .foregroundColor(isSelected ? Color.historyPurple : Color.historyDisabledGray)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 89)
                    .stroke( isSelected ? Color.historyPurple : Color.historyDisabledGray, lineWidth: 1.2)
            )
        }

    }
}

#Preview {
    ProjectCardinalNumberView()
}
