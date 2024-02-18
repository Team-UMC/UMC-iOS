//
//  DetailButton.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct DetailButton: View {
    
    @StateObject private var viewModel = ContentDetailViewModel()

    
    var body: some View {
        HStack{
            Button(action: {
                viewModel.likeCount += 1
            }) {
                HStack(spacing: 8) {
                    Image("commentLike")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 10, height: 10)
                        
                    
                    Text("좋아요")
                        .font(.system(size: 10))
                        .foregroundColor(Color("#999999"))
                    
                }
                .padding(6)
                .background(Color("#F6F6F6"))
                .cornerRadius(8)
            }
                Button(action: {
                    viewModel.commentCount += 1
                }) {
                    HStack{
                        HStack(spacing: 8) {
                            Image("commentWrite")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                            
                            Text("댓글")
                                .font(.system(size: 10))
                                .foregroundColor(Color("#999999"))
                            
                        }
                        .padding(6)
                        .background(Color("#F6F6F6"))
                        .cornerRadius(8)
                    }
                }
                
            }
        }
        
    }


#Preview {
    DetailButton()
}

