//
//  ApiEndpoints.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import Foundation

enum ApiEndpoints {
    static let scheme = "http"
    static let host = "umcservice.shop"
    static let port = 8000
    
    enum Path: String {
        // members
        case members = "/members"
        case members_login = "/members/login"
        case members_logout = "/members/logout"
        case members_token_refresh = "/members/token/refresh"
        case members_github = "/members/github"
        case members_points = "/members/points"
        case members_rank = "/members/update"
        
        // schedules
        case schedules = "/schedules"
        case schedules_calendar = "/schedules/calendar"
        case scheudles_detail = "/schedules/detail"
        
        // boards
        case boards = "/boards/comments"
        case boards_comments_member_comments_app = "/boards/comments/member/comments/app"
        case boards_comments_member_comments_web = "/boards/comments/member/comments/web"
        
        // todoList
        case todoLists = "/to-do-lists"
        case todoLists_update = "/to-do-lists/update"
        
        // university
        case universities = "/universities"
        case universities_details = "/universities/details"
        case universities_mascot = "/universities/mascot"
        case universities_members = "/universities/members"
        case universities_ranks = "/universities/ranks"
        
        // staff-university
        case staff_universities = "/staff/universities"
        
        // staff-schedule
        case staff_schedules = "/staff/schedules"
    }
}

extension ApiEndpoints {
    static func getBasicUrlComponents() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = ApiEndpoints.scheme
        urlComponents.host = ApiEndpoints.host
        urlComponents.port = ApiEndpoints.port
    return urlComponents
}
}
