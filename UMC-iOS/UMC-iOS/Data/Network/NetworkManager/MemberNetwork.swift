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
    
    // GET
    
    // 멤버 API - 유저 프로필 조회 API(fetch)
    @MainActor
    func fetchGetMemberProfile(memberId: String) async -> MemberResponse.GetMemberProfile {
        do {
            let memberProfile = try await getMemberProfile(memberId: memberId)
            print(memberProfile)
            return memberProfile
            
        } catch {
            print("Error: \(error)")
            return MemberResponse.GetMemberProfile()
        }
    }
    
    // 멤버 API - 유저 프로필 조회 API
    func getMemberProfile(memberId: String) async throws -> MemberResponse.GetMemberProfile {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.members.rawValue
        if memberId != "" {
            urlComponents.path.append("/\(memberId)")
        }
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        guard let jsonString = String(data: data, encoding: .utf8) else {
            print("Error: Failed to convert data to string")
            throw ExchangeRateError.decodeFailed
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<MemberResponse.GetMemberProfile>.self, from: data)
        
        var memberProfile: MemberResponse.GetMemberProfile
        memberProfile = jsonDictionary.result
        print(memberProfile)
        
        return memberProfile
    }
    
    
    // 멤버 API - 나의 프로필 수정 API(fetch)
    @MainActor
    func fetchUpdateMyProfile(request: MemberRequest.UpdateMyProfile, profileImage: FileInfo) async {
        do {
            print("fetchUpdateMyProfile : \(request)")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(request)
            let sendData = try encoder.encode(request)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchUpdateMyProfile : \(jsonString)")
            }
            print(request)
            
            let response = try await updateMyProfile(sendData: sendData, profileImage: profileImage)
            print(response)

        } catch {
            print("Error: \(error)")
        }
    }
    
    // 멤버 API - 나의 프로필 수정 API
    func updateMyProfile(sendData: Data, profileImage: FileInfo?) async throws -> MemberResponse.MemberId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.members_update.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        var body = Data()
        
        // Multipart image 데이터 추가
        
        if let profileImage = profileImage {
            let imageData = Data.createImageData(boundary: boundary, data: profileImage.data, mimeType: profileImage.mimeType, imageName: profileImage.fileName)
            body.append(imageData)
        }
        
        // JSON 데이터 추가
        let jsonData = Data.createJsonStringData(boundary: boundary, data: sendData)
        body.append(jsonData)
        body.append("--".appending(boundary.appending("--")).data(using: .utf8)!)
        
        request.httpBody = body
        
        
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
        print(memberId)
        
        return memberId
    }
    
    // 운영진용 멤버 API - 유저 정보 수정 API(fetch)
    @MainActor
    func fetchUpdateMemberProfile(request: MemberRequest.UpdateMyProfile, profileImage: FileInfo) async {
        do {
            print("fetchUpdateMemberProfile : \(request)")
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(request)
            let sendData = try encoder.encode(request)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchUpdateMemberProfile : \(jsonString)")
            }
            print(request)
            
            let response = try await updateMyProfile(sendData: sendData, profileImage: profileImage)
            print(response)

        } catch {
            print("Error: \(error)")
        }
    }
    
    // 멤버 API - 나의 프로필 수정 API
    func updateMemberProfile(sendData: Data, profileImage: FileInfo?) async throws -> MemberResponse.MemberId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.members_update.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        var body = Data()
        
        // Multipart image 데이터 추가
        
        if let profileImage = profileImage {
            let imageData = Data.createImageData(boundary: boundary, data: profileImage.data, mimeType: profileImage.mimeType, imageName: profileImage.fileName)
            body.append(imageData)
        }
        
        // JSON 데이터 추가
        let jsonData = Data.createJsonStringData(boundary: boundary, data: sendData)
        body.append(jsonData)
        body.append("--".appending(boundary.appending("--")).data(using: .utf8)!)
        
        request.httpBody = body
        
        
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
        print(memberId)
        
        return memberId
    }
    
    
//    // Update user profile
//    func updateUserProfile() {
//        guard let url = URL(string: "https://umcservice.shop:8000/members/update") else {
//            print("유효하지 않은 URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let parameters: [String: Any] = [
//            "userNickname": userNickname,
//            "userName": userName,
//            "message": message
//        ]
//
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
//            request.httpBody = jsonData
//
//            URLSession.shared.dataTask(with: request) { (data, response, error) in
//                if let error = error {
//                    print("에러: \(error.localizedDescription)")
//                } else if let data = data {
//                    print("응답: \(String(data: data, encoding: .utf8) ?? "")")
//                }
//            }.resume()
//        } catch {
//            print("매개변수를 JSON으로 변환하는 동안 에러 발생: \(error.localizedDescription)")
//        }
//    }
    
    
    
}
