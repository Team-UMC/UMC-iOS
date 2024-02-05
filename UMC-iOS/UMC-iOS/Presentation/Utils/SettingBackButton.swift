//
//  File.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/21/24.
//

import SwiftUI

struct SettingBackButton: ViewModifier {
    let title: String
    let onDismiss: (() -> Void)?
    var showTrailingItem: Bool = true

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { onDismiss?() }) {
                        Image(systemName: "chevron.left").foregroundColor(.black)
                    }
                }
                if showTrailingItem{
                    ToolbarItem(placement: .topBarTrailing){
                        HStack {
                            Spacer() // 왼쪽 공간 추가
                            Text("완료")
                                .foregroundStyle(.white)
                            Spacer() // 오른쪽 공간 추가
                        }
                        .frame(width: 48, height: 30)
                        .background(.main)
                        .cornerRadius(12)
                    }
                }
            }
            .onDisappear {
                onDismiss?()
            }
    }
}
