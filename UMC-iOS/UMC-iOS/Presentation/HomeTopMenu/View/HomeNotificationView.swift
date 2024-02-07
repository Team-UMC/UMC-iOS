//
//  HomeNotificationView.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI

struct HomeNotificationView:View {
    @Environment(\.dismiss) private var dismiss
    
    let notifications: [Notification] = [
            Notification(title: "[교내] 2차 회식 안내", description: "벡스", isUnread: true, date: "1시간전"),
            Notification(title: "[연합] 데모데이 관련 공지입니다.", description: "우디", isUnread: false, date: "23.12.13"),
            // 추가 알림 데이터...
        ]

    var body: some View {
        List {
            ForEach(notifications) { notification in
                HStack {
                    // 읽지 않은 알림의 경우 보라색 동그라미 표시
                    if notification.isUnread {
                        Circle()
                            .fill(.main)  // 보라색으로 채움
                            .frame(width: 10, height: 10)  // 크기 지정
                    } else{
                        Spacer().frame(width: 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(notification.title)
                            .font(.system(size: 16, weight: .medium))  // 제목 폰트 스타일
                            .foregroundStyle(notification.isUnread ? .main : .black)
                        Text(notification.description)
                            .font(.subheadline)  // 내용 폰트 스타일
                            .foregroundColor(.gray)  // 글자색 설정
                    }
                    
                    Spacer()  // 왼쪽 요소와 오른쪽 요소 사이에 공간 추가
                    
                    // 알림 받은 시간 표시
                    Text(notification.date)
                        .font(.caption)  // 시간 폰트 스타일
                        .foregroundColor(.gray)  // 글자색 설정
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .modifier(SettingBackButton(title: "알림", onDismiss: { dismiss() }, showTrailingItem: false, ImageName: "xmark"))
    }
}

#Preview {
    HomeNotificationView()
}
