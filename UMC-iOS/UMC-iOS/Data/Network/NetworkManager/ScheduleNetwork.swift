//
//  ScheduleNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

class ScheduleNetwork: ObservableObject {
    
    
    // Schedule API - 캘린더 조회 API(fetch)
    @MainActor
    func fetchGetCalendar(request: ScheduleRequest.GetCalendar) async {
        do {
            print("fetchFeedUniversityMascot : \(request)")
            print(request)
            
            let response = try await getCalendar(date: request.date)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // Schedule API - 캘린더 조회 API
    func getCalendar(date: String) async throws -> ScheduleResponse.GetCalendar {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.schedules_calendar.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "date", value: date)]
        
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<ScheduleResponse.GetCalendar>.self, from: data)
        
        var calendarResponse: ScheduleResponse.GetCalendar
        calendarResponse = jsonDictionary.result
        print(calendarResponse)
        
        return calendarResponse
    }
    
}
