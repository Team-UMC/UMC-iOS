//
//  JoinCodeViewModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/10/24.
//

import SwiftUI

class JoinViewModel: ObservableObject {
    @Published var inviteCode: String = ""
    @Published var isQRAuthenticated: Bool = false
    
    var isInviteCodeValid: Bool {
        // 초대코드의 유효성을 확인하는 로직을 추가하세요.
        return inviteCode.count >= 6
    }
    
    //선택된 기수 리스트.
    @Published var selectedGeneration: [String] = []
    //선택된 파트 리스트.
    @Published var selectedParts: [String] = []
    
    //circle border button 사용시 함께 사용되는 함수. 선택된 버튼들 리스트에 저장 and 선택해제된 버튼은 리스트에서 제거.
    func handleButtonSelection(_ title: String, selected: inout [String]) {
        if selected.contains(title) {
            selected.removeAll { $0 == title }
            print("\(title) 삭제")
        } else {
            selected.append(title)
            print("\(title) 추가")
        }
        print(selected)
    }
    
    //join Agreement에 관한 변수와 함수.
    //모두 동의 누르면 다른 버튼도 동의버튼으로 바뀜.
    @Published var isAllAgreed = false
    @Published var isTermsAgreed = false
    @Published var isPrivacyAgreed = false

    func toggleAllAgreements() {
        isTermsAgreed = isAllAgreed
        isPrivacyAgreed = isAllAgreed
    }

    func toggleTermsAgreement() {
        updateAllAgreed()
    }

    func togglePrivacyAgreement() {
        updateAllAgreed()
    }

    private func updateAllAgreed() {
        isAllAgreed = isTermsAgreed && isPrivacyAgreed
    }
    
}
