//
//  TodayILearnedHomeList.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/19/24.
//

import SwiftUI

struct TodayILearnedHomeList: View {
    var todayILearneds: TodayILearnedResponse.GetTodayILearned
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Today I - Leanred")
                    .font(.system(size: 16, weight: .semibold))
                    .kerning(-1.05)
                    .foregroundStyle(Color.main2)
                
                Spacer()
            }
            .padding(.bottom, 12)
            ZStack {
                Rectangle()
                    .frame(height: 128)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.gray.opacity(0.25), radius: 6, x: 0, y: 2)
                
                
                ScrollView {
                    VStack(spacing: 8) {
                    ForEach(todayILearneds.todayILearnedInfos.indices, id: \.self) { index in
                            Button {
                                print(index)
                            } label: {
                                TodayILearnedHomeCell(todayILearnedInfo: todayILearneds.todayILearnedInfos[index])
                                    .frame(height: 30)
                            }
                        }
                        Button {
                            
                        } label: {
                            TodayILearnedCreateCell()
                        }
                    }
                    .foregroundStyle(Color.black)
                    .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                }
                .frame(height: 128)
            }
        }
        .padding(.leading, 18)
    }
}

//#Preview {
//    TodayILearnedHomeList()
//}
