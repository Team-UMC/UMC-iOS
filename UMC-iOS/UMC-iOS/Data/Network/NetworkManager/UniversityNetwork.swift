//
//  UniversityNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/11/24.
//

import Foundation

class UniversityNetwork: ObservableObject {
//    @Published var universities: [University] = []
    
    
    // POST
    
    // University API - 우리 학교 마스코트 먹이주기 API(fetch)
    @MainActor
    static func fetchFeedUniversityMascot(request: UniversityRequest.FeedUniversityMascot) async -> UniversityResponse.FeedUniversityMascot {
        var feedResponse = UniversityResponse.FeedUniversityMascot()
        do {
            print("fetchFeedUniversityMascot : \(request)")
            print(request.pointType.rawValue)
            
            feedResponse = try await feedUniversityMascot(pointType: request.pointType.rawValue)
        } catch {
            print("Error: \(error)")
        }
        
        return feedResponse
    }
    
    // University API - 우리 학교 마스코트 먹이주기 API
    static func feedUniversityMascot(pointType: String) async throws -> UniversityResponse.FeedUniversityMascot {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities_mascot.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "pointType", value: pointType)]
        
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.FeedUniversityMascot>.self, from: data)
        
        var feedResponse: UniversityResponse.FeedUniversityMascot
        feedResponse = jsonDictionary.result
        print(feedResponse)
        
        return feedResponse
    }
    
    // Staff 학교 생성 및 수정 - 데모데이 이후 구현 예정
//    // Staff University API - 학교 생성하기 API(fetch)
//    @MainActor
//    func fetchCreateUniversityForStaff(request: UniversityRequest.CreateUniversityForStaff) async {
//        do {
//            print("fetchCreateUniversityForStaff : \(request)")
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//            print(request)
//            let sendData = try encoder.encode(request)
//            if let jsonString = String(data: sendData, encoding: .utf8) {
//                print("fetchCreateTodoList : \(jsonString)")
//            }
//            print(request)
//            
//            let response = try await createUniversityForStaff(sendData: sendData)
//        } catch {
//            print("Error: \(error)")
//        }
//    }
//    
//    // 멀티파트용 이미지 데이터 생성
//    func createMultipartData(imageData: Data?, boundary: String) -> Data {
//        var body = Data()
//        if let imageData = imageData {
//            body.append("--\(boundary)\r\n".data(using: .utf8)!)
//            body.append("Content-Disposition: form-data; name=\"images\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
//        }
//        
//        return Data()
//    }
//    
//    // Staff University API - 학교 생성하기 API(fetch)
//    func createUniversityForStaff(sendData: Data) async throws -> UniversityResponse.UniversityId {
//        
//        // urlComponents 설정
//        var urlComponents = ApiEndpoints.getBasicUrlComponents()
//        urlComponents.path = ApiEndpoints.Path.staff_universities.rawValue
//        
//        // urlComponetns -> url로 변환
//        guard let url = urlComponents.url else {
//            print("Error: cannot create URL")
//            throw ExchangeRateError.cannotCreateURL
//        }
//        
//        // request Header 설정
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        let boundary = "Boundary-\(UUID().uuidString)"
//        request.setValue("mulipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
//        
//        // request Body 설정
//        request.httpBody = sendData
//        
//        // URLSession으로 통신
//        let (data, response) = try await URLSession.shared.data(for: request)
//        print(data)
//        print(response)
//        
//        if let response = response as? HTTPURLResponse,
//           !(200..<300).contains(response.statusCode) {
//            throw ExchangeRateError.badRequest
//        }
//        
//        let decoder = JSONDecoder()
//        
//        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.UniversityId>.self, from: data)
//        
//        var universityId: UniversityResponse.UniversityId
//        universityId = jsonDictionary.result
//        print(universityId)
//        
//        return universityId
//    }
    
    // GET
    
    // University API - 전체 학교 조회 API(fetch)
    @MainActor
    static func fetchGetUniversityList() async -> UniversityResponse.GetUniversityList {
        var universities = UniversityResponse.GetUniversityList()
        do {
            universities = try await getUniversityList()
            print(universities)
//            universities = universities.joinUniversities.mapToUniversityList()
            
            
        } catch {
            print("Error: \(error)")
        }
        return universities
    }
    
    // University API - 전체 학교 조회 API
    static func getUniversityList() async throws -> UniversityResponse.GetUniversityList {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print("UserDefaults : \(UserDefaults.standard.string(forKey: "Authorization"))")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.GetUniversityList>.self, from: data)
        
        print(jsonDictionary)
        
        var universities: UniversityResponse.GetUniversityList
        universities = jsonDictionary.result
        
        return universities
    }
    
    // University API - 우리 학교 세부 정보 조회 API(fetch)
    @MainActor
    static func fetchGetUniversityDetail() async -> UniversityResponse.GetUniverSityDetail {
        var universityDetail = UniversityResponse.GetUniverSityDetail()
        do {
            universityDetail = try await getUniversityDetail()
            
            print(universityDetail)
        } catch {
            print("Error: \(error)")
        }
        return universityDetail
    }
    
    // University API - 우리 학교 세부 정보 조회 API
    static func getUniversityDetail() async throws -> UniversityResponse.GetUniverSityDetail {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities_details.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.GetUniverSityDetail>.self, from: data)
        
        print(jsonDictionary)
        
        var universityDetail: UniversityResponse.GetUniverSityDetail
        universityDetail = jsonDictionary.result
        
        return universityDetail
    }
    
    // University API - 우리 학교 마스코트 조회 API(fetch)
    @MainActor
    static func fetchGetMascotInfo() async -> UniversityResponse.GetUniversityMascotInfo {
        var mascotInfo = UniversityResponse.GetUniversityMascotInfo()
        do {
            mascotInfo = try await getMascotInfo()
            
        } catch {
            print("Error: \(error)")
        }
        return mascotInfo
    }
    
    // University API - 우리 학교 마스코트 조회 API
    static func getMascotInfo() async throws -> UniversityResponse.GetUniversityMascotInfo {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities_mascot.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.GetUniversityMascotInfo>.self, from: data)
        
        
        var mascotInfo: UniversityResponse.GetUniversityMascotInfo
        mascotInfo = jsonDictionary.result
        
        return mascotInfo
    }
    
    // University API - 전체 학교 랭킹 조회 API(fetch)
    @MainActor
    static func fetchGetUniversityRanks() async -> UniversityResponse.GetUniversityRanks {
        var universityRanks = UniversityResponse.GetUniversityRanks()
        do {
            universityRanks = try await getUniversityRanks()
//            self.universities = universityRanks.joinUniversityRanks.mapToUniversityList()
            
            print(universityRanks)
//            print(self.universities)
        } catch {
            print("Error: \(error)")
        }
        return universityRanks
    }
    
    // University API - 전체 학교 랭킹 조회 API
    static func getUniversityRanks() async throws -> UniversityResponse.GetUniversityRanks {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities_ranks.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.GetUniversityRanks>.self, from: data)
        
        print(jsonDictionary)
        
        var universityRanks: UniversityResponse.GetUniversityRanks
        universityRanks = jsonDictionary.result
        
        return universityRanks
    }
    
    // University API - 우리 학교 전체 기여도 랭킹 조회 API(fetch)
    @MainActor
    static func fetchGetUniversityContributors() async {
        do {
            let joinContributionRanks = try await getUniversityContributors()
            
            print(joinContributionRanks)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // University API - 우리 학교 전체 기여도 랭킹 조회 API
    static func getUniversityContributors() async throws -> UniversityResponse.GetUniversityContributors {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities_members.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print("UserDefaults : \(UserDefaults.standard.string(forKey: "Authorization"))")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.GetUniversityContributors>.self, from: data)
        
        print(jsonDictionary)
        
        var joinContributionRanks: UniversityResponse.GetUniversityContributors
        joinContributionRanks = jsonDictionary.result
        
        return joinContributionRanks
    }
}
