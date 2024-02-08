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
    
    //직책 선택 in 학교 선택된 기수 리스트.
    @Published var selectedPosition_inUnivs: [String] = []
    //직책 선택 in 중앙 선택된 기수 리스트.
    @Published var selectedPosition_central: [String] = []
    
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
    
    //selectpartAndGeneration View에 관한 viewmodel
    @Published var selections: [JoinViewSelectedInfo] = []
        
    // selections 배열 내에 적어도 하나의 세트가 nil이 아닌지 확인하는 계산 속성
    var isAtLeastOneSelected: Bool {
        selections.contains { $0.selectedGeneration != nil && $0.selectedPart != nil}
    }
        
    init() {
        // 초기 상태에서 최소 한 개의 선택지를 추가
        addSelection()
    }
        
    // 새로운 선택 항목을 추가하는 메소드
    func addSelection() {
        selections.append(JoinViewSelectedInfo())
        print(selections)
    }
        
    // 특정 인덱스의 선택 항목을 제거하는 메소드
    func removeSelection(at index: Int) {
        if selections.count > 1 { 
            // 최소 한 개의 선택지 유지
            selections.remove(at: index)
        }
    }
}

extension JoinViewModel {
    // API 연결
    
    // POST
    @MainActor
    func fetchSignUpMember(signUpMemberInfo: MemberRequest.SignUpMember) async {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let sendData = try encoder.encode(signUpMemberInfo)
            try await signUpMember(sendData: sendData)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func signUpMember(sendData: Data) async throws {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.members.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(UserDefaults.standard.string(forKey: "jwtAccessToken"), forHTTPHeaderField: "Authorization")
        request.httpBody = sendData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badResponse
        }
//        
//        guard let jsonString = String(data: data, encoding: .utf8) else {
//            print("Error: Failed to convert data to string")
//            throw ExchangeRateError.decodeFailed
//        }
//        
//        do {
//            let jsonDictionary = try JSONDecoder().decode(BaseResponse<MemberResponse.SignUpMember>.self, from: data)
//        } catch {
//            print("Error decoding JSON: \(error)")
//        }
    }
}
