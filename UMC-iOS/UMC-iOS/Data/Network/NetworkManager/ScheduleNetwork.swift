//
//  ScheduleNetwork.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import Foundation

class ScheduleNetwork: ObservableObject {
    
    
    // GET
    // Schedule API - 일정 조회(상세조회) API(fetch)
    @MainActor
    func fetchGetScheduleDetail(scheduleId: String) async -> ScheduleResponse.GetSchedulesDetail {
        var scheduleDetail = ScheduleResponse.GetSchedulesDetail()
        do {
            print("fetchGetScheduleDetail : \(scheduleId)")
            
            scheduleDetail = try await getScheduleDetail(scheduleId: scheduleId)
            print(scheduleDetail)
        } catch {
            print("Error: \(error)")
        }
        return scheduleDetail
    }
    
    // Schedule API - 일정 조회(상세조회) API
    func getScheduleDetail(scheduleId: String) async throws -> ScheduleResponse.GetSchedulesDetail {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.scheudles_detail.rawValue + "/\(scheduleId)"
        
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
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<ScheduleResponse.GetSchedulesDetail>.self, from: data)
        
        var scheduleDetail: ScheduleResponse.GetSchedulesDetail
        scheduleDetail = jsonDictionary.result
        print(scheduleDetail)
        
        return scheduleDetail
    }
    
    // POST
    
    // Schedule API - 캘린더 조회 API(fetch)
    @MainActor
    func fetchGetCalendar(request: ScheduleRequest.GetCalendar) async -> ScheduleResponse.GetCalendar {
        var calendarInfo = ScheduleResponse.GetCalendar()
        do {
            print("fetchGetCalendar : \(request)")
            print(request)
            
            calendarInfo = try await getCalendar(date: request.date)
        } catch {
            print("Error: \(error)")
        }
        
        return calendarInfo
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
    
    // Schedule API - 일정 추가 API(fetch)
    @MainActor
    func fetchCreateSchedule(request: ScheduleRequest.CreateSchedule) async {
        do {
            print("fetchCreateSchedule : \(request)")
            print(request)
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(request)
            let sendData = try encoder.encode(request)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchCreateSchedule : \(jsonString)")
            }
            let response = try await createSchedule(
                sendData: sendData)
            print(response)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // Schedule API - 일정 추가 API
    func createSchedule(sendData: Data) async throws -> ScheduleResponse.ScheduleId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.staff_schedules.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        request.httpBody = sendData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<ScheduleResponse.ScheduleId>.self, from: data)
        
        var createScheduleResponse: ScheduleResponse.ScheduleId
        createScheduleResponse = jsonDictionary.result
        
        
        return createScheduleResponse
    }
    
    // Schedule API - 일정 삭제 API(fetch)
    @MainActor
    func fetchDeleteSchedule(request: ScheduleRequest.DeleteSchedule) async {
        do {
            print("fetchCreateSchedule : \(request)")
            print(request)
            
            let scheduleId = try await deleteSchedule(scheduleId: request.scheduleId)
            print(scheduleId)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // Schedule API - 일정 삭제 API
    func deleteSchedule(scheduleId: String) async throws -> ScheduleResponse.ScheduleId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.staff_schedules.rawValue + "/\(scheduleId)"
        
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
        
        let jsonDictionary = try decoder.decode(BaseResponse<ScheduleResponse.ScheduleId>.self, from: data)
        
        var scheduleId: ScheduleResponse.ScheduleId
        scheduleId = jsonDictionary.result
    
        
        return scheduleId
    }
    
    
    // Schedule API - 일정 수정 API(fetch)
    @MainActor
    func fetchUpdateSchedule(scheduleId: String, request: ScheduleRequest.UpdateSchedule) async {
        do {
            print("fetchUpdateSchedule : \(request)")
            print(request)
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            print(request)
            let sendData = try encoder.encode(request)
            if let jsonString = String(data: sendData, encoding: .utf8) {
                print("fetchUpdateSchedule : \(jsonString)")
            }
            let response = try await updateSchedule(
                scheduleId: scheduleId, sendData: sendData)
            print(response)
        } catch {
            print("Error: \(error)")
        }
    }
    
    // Schedule API - 일정 수정 API
    func updateSchedule(scheduleId: String, sendData: Data) async throws -> ScheduleResponse.ScheduleId {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.staff_schedules_update.rawValue + "/\(scheduleId)"
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(UserDefaults.standard.string(forKey: "Authorization"), forHTTPHeaderField: "Authorization")
        request.httpBody = sendData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(data)
        print(response)
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badRequest
        }
        
        let decoder = JSONDecoder()
        
        let jsonDictionary = try decoder.decode(BaseResponse<ScheduleResponse.ScheduleId>.self, from: data)
        
        var scheduleId: ScheduleResponse.ScheduleId
        scheduleId = jsonDictionary.result
        
        
        return scheduleId
    }
    
}
