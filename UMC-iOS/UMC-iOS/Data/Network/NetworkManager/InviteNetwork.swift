//
//  InviteNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/18/24.
//

import Foundation

class InviteNetwork: ObservableObject {
    
    // API
    
    // POST
    // 초대 API - 초대 코드 확인 API(fetch)
    @MainActor
    func fetchVerifyInviteCode(inviteCode: String) async -> String {
        var response: String = ""
        do {
            print("fetchCreateBoardComment : \(inviteCode)")
            
            response = try await verifyInviteCode(inviteCode: inviteCode).role
            print(response)

        } catch {
            print("Error: \(error)")
        }
        return response
    }
    
    // 초대 API - 초대 코드 확인 API
    func verifyInviteCode(inviteCode: String) async throws -> InviteResponse.VerifyInviteCode {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.invites.rawValue
        urlComponents.path.append("/\(inviteCode)")
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<InviteResponse.VerifyInviteCode>.self, from: data)
        
        var role: InviteResponse.VerifyInviteCode
        role = jsonDictionary.result
        print(role)
        
        return role
    }
    
}
