//
//  TodayILearnedNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/19/24.
//

import Foundation

class TodayILearnedNetwork: ObservableObject {
    
    // TodayILearned API - 투두리스트 조회 API(fetch)
    @MainActor
    func fetchGetTodayILearned(date: String) async -> TodayILearnedResponse.GetTodayILearned {
        var todayILearnedInfos = TodayILearnedResponse.GetTodayILearned()
        do {
            todayILearnedInfos = try await getTodayILearneds(date: date)
            print(todayILearnedInfos)
            
        } catch {
            print("Error: \(error)")
        }
        return todayILearnedInfos
    }
    
    // TodoList API - 투두리스트 조회 API
    func getTodayILearneds(date: String) async throws -> TodayILearnedResponse.GetTodayILearned {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.today_i_learned.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "date", value: date)]
        
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<TodayILearnedResponse.GetTodayILearned>.self, from: data)
        
        var todayILerneds: TodayILearnedResponse.GetTodayILearned
        todayILerneds = jsonDictionary.result
        
        return todayILerneds
    }
}
