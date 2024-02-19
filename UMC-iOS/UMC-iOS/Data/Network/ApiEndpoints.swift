//
//  ApiEndpoints.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import Foundation

enum ApiEndpoints {
    // dev
    static let scheme = "http"
    static let host = "umcservice.shop"
    static let port = 8000
    
    // local
//    static let scheme = "http"
//    static let host = "localhost"
//    static let port = 8080
    
    enum Path: String {
        // members
        case members = "/members"
        case members_update = "/members/update"
        case members_login = "/members/login"
        case members_logout = "/members/logout"
        case members_token_refresh = "/members/token/refresh"
        case members_github = "/members/github"
        case members_points = "/members/points"
        case members_rank = "/members/rank"
        
        // schedules
        case schedules = "/schedules"
        case schedules_calendar = "/schedules/calendar"
        case scheudles_detail = "/schedules/detail"
        
        // boards
        case boards = "/boards"
        case heart = "/heart"
        case pin = "/pin"
        case boards_pinned = "/boards/pinned"
        case boards_member_app = "/boards/member/app"
        case boards_member_hearts_app = "/boards/member/hearts/app"
        case boards_search = "/boards/search"
        case boards_comments = "/boards/comments"
        case boards_comments_member_comments_app = "/boards/comments/member/comments/app"
        case staff_boards_notices = "/staff/boards/notices"
        
        // todoList
        case todoLists = "/to-do-lists"
        case todoLists_update = "/to-do-lists/update"
        
        // today-i-learned
        case today_i_learned = "/today-i-learned"
        
        // university
        case universities = "/universities"
        case universities_details = "/universities/details"
        case universities_mascot = "/universities/mascot"
        case universities_members = "/universities/members"
        case universities_ranks = "/universities/ranks"
        
        // invite
        case invites = "/invites"
        
        // staff-university
        case staff_universities = "/staff/universities"
        
        // staff-schedule
        case staff_schedules = "/staff/schedules"
        case staff_schedules_update = "/staff/schedules/update"
        
        // staff-invites
        case staff_invites = "/staff/invites"
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
