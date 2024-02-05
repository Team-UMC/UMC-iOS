//
//  CircleCustomButton.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/22/24.
//

import SwiftUI

//동그라미 체크박스 버튼 (ex: 관리자 설정 핀)
struct ManagerPinButton: View {
    @State var circleInCircleButton_isChecked: Bool = false
    var WrittenPerson: String = "벡스"
    var writtenTime: Int = 1
    var Sortedpart: String
    var title: String
    var action: () -> Void
    
    var body: some View {
        HStack{
            Button(action: {
                circleInCircleButton_isChecked.toggle()
                action()
            }, label: {
                if circleInCircleButton_isChecked{
                    ZStack{
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.main)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(.main)
                    }
                } else{
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color(.lightGray))
                }
                
                VStack{
                    HStack{
                        Text("[\(Sortedpart)] \(title)")
                            .foregroundStyle(circleInCircleButton_isChecked ? .main : .black)
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        Text("\(writtenTime)시간전")
                            .foregroundStyle(Color(.lightGray))
                            .font(.system(size: 12))
                    }
                    HStack{
                        Text(" \(WrittenPerson)")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                        Spacer()
                    }
                }
            })
        }
    }
}
