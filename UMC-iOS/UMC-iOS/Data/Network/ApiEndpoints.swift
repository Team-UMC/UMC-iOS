//
//  ApiEndpoints.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import Foundation

fileprivate enum ApiEndpoints {
    static let scheme = "http"
    static let host = "umcservice.shop"
    static let port = 8080
    
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
    }
}
