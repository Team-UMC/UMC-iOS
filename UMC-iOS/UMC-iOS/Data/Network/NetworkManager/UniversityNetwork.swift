//
//  UniversityNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/11/24.
//

import Foundation

class UniversityNetwork: ObservableObject {
    @Published var universities: [University] = []
    
    
    // POST
    
    // University API - 우리 학교 마스코트 먹이주기 API(fetch)
    @MainActor
    func fetchFeedUniversityMascot(request: UniversityRequest.FeedUniversityMascot) async {
        do {
            print("fetchFeedUniversityMascot : \(request)")
            print(request.pointType.rawValue)
            
            let response = try await createTodoList(pointType: request.pointType.rawValue)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // University API - 우리 학교 마스코트 먹이주기 API
    func createTodoList(pointType: String) async throws -> UniversityResponse.FeedUniversityMascot {
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
    
    // GET
    
    // University API - 전체 학교 조회 API(fetch)
    @MainActor
    func fetchGetUniversityList() async {
        do {
            let universities = try await getUniversityList()
            print(universities)
            self.universities = universities.joinUniversities.mapToUniversityList()
            
            print(self.universities)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // University API - 전체 학교 조회 API
    func getUniversityList() async throws -> UniversityResponse.GetUniversityList {
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
    func fetchGetUniversityDetail() async {
        do {
            let universityDetail = try await getUniversityDetail()
            
            print(universityDetail)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // University API - 우리 학교 세부 정보 조회 API
    func getUniversityDetail() async throws -> UniversityResponse.GetUniverSityDetail {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities_details.rawValue
        
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.GetUniverSityDetail>.self, from: data)
        
        print(jsonDictionary)
        
        var universityDetail: UniversityResponse.GetUniverSityDetail
        universityDetail = jsonDictionary.result
        
        return universityDetail
    }
    
    // University API - 우리 학교 마스코트 조회 API(fetch)
    @MainActor
    func fetchGetMascotInfo() async {
        do {
            let universityDetail = try await getMascotInfo()
            
            print(universityDetail)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // University API - 우리 학교 마스코트 조회 API
    func getMascotInfo() async throws -> UniversityResponse.GetUniversityMascotInfo {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities_mascot.rawValue
        
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.GetUniversityMascotInfo>.self, from: data)
        
        print(jsonDictionary)
        
        var mascotInfo: UniversityResponse.GetUniversityMascotInfo
        mascotInfo = jsonDictionary.result
        
        return mascotInfo
    }
    
    // University API - 전체 학교 랭킹 조회 API(fetch)
    @MainActor
    func fetchGetUniversityRanks() async {
        do {
            let universityRanks = try await getUniversityRanks()
            self.universities = universityRanks.joinUniversityRanks.mapToUniversityList()
            
            print(universityRanks)
            print(self.universities)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // University API - 전체 학교 랭킹 조회 API
    func getUniversityRanks() async throws -> UniversityResponse.GetUniversityRanks {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.universities_ranks.rawValue
        
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<UniversityResponse.GetUniversityRanks>.self, from: data)
        
        print(jsonDictionary)
        
        var universityRanks: UniversityResponse.GetUniversityRanks
        universityRanks = jsonDictionary.result
        
        return universityRanks
    }
    
    // University API - 우리 학교 전체 기여도 랭킹 조회 API(fetch)
    @MainActor
    func fetchGetUniversityContributors() async {
        do {
            let joinContributionRanks = try await getUniversityContributors()
            
            print(joinContributionRanks)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // University API - 우리 학교 전체 기여도 랭킹 조회 API
    func getUniversityContributors() async throws -> UniversityResponse.GetUniversityContributors {
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
