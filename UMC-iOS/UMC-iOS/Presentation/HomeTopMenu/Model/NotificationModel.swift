//
//  NotificationModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import Foundation

// 알림을 나타내는 모델 정의
struct Notification: Identifiable {
    let id = UUID()  // 고유 식별자
    let title: String  // 알림 제목
    let description: String  // 알림 내용
    let isUnread: Bool  // 읽지 않은 상태
    let date: String  // 알림 받은 시간
}
