//
//  UserContentPreList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct UserContentPreList: View {
    @ObservedObject var viewModel = BulletinBoardViewModel()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) { post in
                NavigationLink(destination: BulletinBoardContentDetailUI()) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            // 프로필 이미지
                            Image(systemName: "person.circle.fill") // 프로필 이미지를 표시할 Image 추가
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 24, height: 24)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.clear))
                            
                            // 유저 이름 닉네임
                            Text("\(post.writer)")
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                            Spacer()
                            
                            // 타임라인
                            if let date = dateFormatter.date(from: post.createdAt) {
                                Text("\(timeAgoString(from: date))")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, 21)
                            }
                        }
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                // 게시글 제목
                                Text("\(post.title)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14).bold())
                                
                                // 게시글 미리보기
                                Text("\(post.content)")
                                    .lineLimit(2)
                                    .foregroundColor(.black)
                                    .font(.system(size: 12))
                                    .multilineTextAlignment(.leading)
                            }
                            
                            // 게시글 이미지
                            Image(systemName: "photo") // 게시글 이미지를 표시할 Image 추가
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 56, height: 56)
                        }
                        
                        HStack {
                            // 좋아요
                            Image("LikeIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 13.91, height: 12.41)
                                .padding(.trailing, -4)
                            Text("\(post.heartCount)")
                                .foregroundColor(Color(red: 135/255, green: 132/255, blue: 255/255))
                                .font(.system(size: 12))
                                .padding(.trailing, 6)
                            
                            // 댓글
                            Image("ConmentIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 13.91, height: 12.41)
                                .padding(.trailing, -4)
                            Text("\(post.commentCount)")
                                .foregroundColor(Color(red: 1.0, green: 199/255, blue: 0))
                                .font(.system(size: 12))
                                .padding(.trailing, 6)
                            
                            // ViewingIcon
                            Image("ViewingIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 13.91, height: 12.41)
                                .padding(.trailing, -2)
                            Text("\(post.hitCount)")
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                                .padding(.trailing, 6)
                        }
                    }
                    .padding(.horizontal, 21)
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
        .onAppear {
            viewModel.fetchBoardPosts {}
        }
    }
}

func timeAgoString(from date: Date) -> String {
    let now = Date()
    let difference = Calendar.current.dateComponents([.minute, .hour, .day], from: date, to: now)
    
    if let days = difference.day, days > 0 {
        return "\(days)일 전"
    } else if let hours = difference.hour, hours > 0 {
        return "\(hours)시간 전"
    } else if let minutes = difference.minute, minutes > 0 {
        return "\(minutes)분 전"
    } else {
        return "방금 전"
    }
}

