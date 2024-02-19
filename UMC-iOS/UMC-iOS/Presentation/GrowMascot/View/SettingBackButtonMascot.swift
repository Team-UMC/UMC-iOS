//
//  SettingBackButtonMascot.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/19.
//

import SwiftUI

struct  SettingBackButtonMascot: ViewModifier {
    let title: String
    let onDismiss: (() -> Void)?
    var showTrailingItem: Bool = true
    var ImageName: String = "chevron.left"
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { onDismiss?() }) {
                        Image(systemName: ImageName).foregroundColor(.white)
                    }
                }
                if showTrailingItem{
                    ToolbarItem(placement: .topBarTrailing){
                        HStack {
                            Spacer() // 왼쪽 공간 추가
                            Text("마스코트 키우기")
                                //.foregroundStyle(.white)
                                .foregroundColor(.white)
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
