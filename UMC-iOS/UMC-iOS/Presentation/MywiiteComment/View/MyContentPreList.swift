//
//  MyContentPreList.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/28.
//

import SwiftUI

struct MyContentPreList: View {
    @ObservedObject var viewModel: MyContentPreListViewModel
    
    init(viewModel: MyContentPreListViewModel) {
            self.viewModel = viewModel
        }

    
    var body: some View {
        VStack{
            HStack{
                
                Text("[\(viewModel.contentIndex)]" + " \(viewModel.contentFirstIndex),\(viewModel.contentSecondIndex)")
                    .font(.system(size: 14))
                    .foregroundColor(Color("NavyText"))
                
                Spacer()
                
                Text("\(viewModel.timeLine)분전")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 21))
            }
            .padding(.bottom,-2)
            
            HStack{
                Text("\(viewModel.contentTitle)")
                    .font(.system(size: 16))
                Spacer()
                
                Button(action: {
                    print("더보기를 눌렀습니다")
                }) {
                    Image("MoreButton")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 14, height: 14)
                        .padding(EdgeInsets(top: 12, leading: 18, bottom: -2, trailing: 20))
                }
                
                
            }
            
        }
        .padding(EdgeInsets(top: 24, leading: 15.5, bottom: 24, trailing: 15.5))
        

    }
}

struct MyContentPreList_Previews: PreviewProvider {
    static var previews: some View {
        MyContentPreList(viewModel: MyContentPreListViewModel(contentTitle: "볼링치러 가실분 있으신가욥?",
                                                              timeLine: 1,
                                                              contentFirstIndex: "지부",
                                                              contentSecondIndex: "자유게시판",
                                                              contentIndex: "게시글"))
    }
}

