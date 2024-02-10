//
//  UserContentPreList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/26.
//

import SwiftUI

struct UserContentPreList: View {
    @ObservedObject var viewModel = BulletinBoardViewModel()
        @State private var isDetailPresented = false
        @State private var selectedPost: BoardPageResponse?

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach($viewModel.boardPosts, id: \.id) { $post in
                    Button(action: {
                        selectedPost = post
                        isDetailPresented = true
                    }) {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 24, height: 24)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.clear))

                                Text("\(post.writer)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 12))
                                Spacer()

                                if let date = dateFormatter.date(from: post.createdAt) {
                                    Text("\(timeAgoString(from: date))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                        .padding(.horizontal, 21)
                                }
                            }

                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("\(post.title)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14).bold())

                                    Text("\(post.content)")
                                        .lineLimit(2)
                                        .foregroundColor(.black)
                                        .font(.system(size: 12))
                                        .multilineTextAlignment(.leading)
                                }

                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 56, height: 56)
                            }

                            HStack {
                                Image("LikeIcon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 13.91, height: 12.41)
                                    .padding(.trailing, -4)
                                Text("\(post.heartCount)")
                                    .foregroundColor(Color(red: 135/255, green: 132/255, blue: 255/255))
                                    .font(.system(size: 12))
                                    .padding(.trailing, 6)

                                Image("ConmentIcon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 13.91, height: 12.41)
                                    .padding(.trailing, -4)
                                Text("\(post.commentCount)")
                                    .foregroundColor(Color(red: 1.0, green: 199/255, blue: 0))
                                    .font(.system(size: 12))
                                    .padding(.trailing, 6)

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
            .navigationDestination(isPresented: $isDetailPresented) {
                            BulletinBoardContentDetailUI()
            }
        }
        .onAppear {
            viewModel.fetchBoardPosts {}
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
}
