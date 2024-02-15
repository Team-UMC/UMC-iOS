//
//  TILCell.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct TILCell: View {
    @StateObject private var viewModel: TILCellViewModel

    init(viewModel: TILCellViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            // 배경
            Rectangle()
                .fill(Color("#F0F4FF"))
                .frame(width: 341, height: 68)
                .cornerRadius(12)
                
            // 이모지
            HStack {
                Rectangle()
                    .fill(.white)
                    .cornerRadius(12)
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: 18, leading: 20, bottom: 18, trailing: 0))
                    .overlay(
                        Text(viewModel.tilIcon)
                            .padding(EdgeInsets(top: 18, leading: 20, bottom: 18, trailing: 0))
                    )
                
                VStack {
                    HStack { // 제목
                        Text("\(viewModel.toDoTitle)")
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                        Spacer()
                    }
                    
                    HStack {
                        // 시간
                        Text("\(viewModel.dayAndNight) \(viewModel.hour):\(viewModel.minute)")
                            .foregroundColor(.black)
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: -6, leading: 0, bottom: -1, trailing: 0))
                        
                        Spacer()
                    }
                }
                
                // 더보기 버튼
                Button(action: {
                    print("더보기를 눌렀습니다")
                    
                }) {
                    Image("MoreButtondarken")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 20))
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct TILCell_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TILCellViewModel(toDoTitle: "Dummy Title", tilIcon: "😀", dayAndNight: "오전", hour: "08", minute: "45")
        TILCell(viewModel: viewModel)
            .previewLayout(.fixed(width: 375, height: 100))
    }
}


