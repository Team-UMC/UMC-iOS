//
//  MemberNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/15/24.
//

import Foundation

class MemberNetwork: ObservableObject {
    
    // 게시판 댓글 API - 댓글 삭제 API(fetch)
    @MainActor
    func fetchDeleteMember() async {
        do {
            print("fetchDeleteMember")
            
            let commentId = try await deleteMember()
        } catch {
            print("Error: \(error)")
        }
    }
    
    // 게시판 댓글 API - 댓글 삭제 API
    func deleteMember() async throws -> MemberResponse.MemberId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.members.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<MemberResponse.MemberId>.self, from: data)
        
        var memberId: MemberResponse.MemberId
        memberId = jsonDictionary.result
    
        
        return memberId
    }
    
}
