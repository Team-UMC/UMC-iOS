//
//  ToDoEditSecondActionSheet.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

struct ToDoEditSecondActionSheet: View {
    
    @State var hour : String
    @State var Minute : String
    
    var body: some View {
        ZStack{
            ToDoEditSheet()
            VStack{
                
                //텍스트
                Text("⏰시간에 맞춰 알림을 보내드릴게요!")
                    .font(.system(size: 12))
                    .foregroundColor(Color("textColor"))
                    .padding(.bottom,16)
                
                HStack{
                    VStack{
                        //오전
                        Button(action: {
                            
                        }) {
                            Text("오전")
                                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                                .background(.white)
                                .foregroundColor(Color("#999999"))
                                .font(.system(size:12))
                                .bold()
                                .cornerRadius(12)
                        }
                        .padding(.bottom,-4)
                        
                        //오후
                        Button(action: {
                            
                        }) {
                            Text("오후")
                                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                                .background(.white)
                                .foregroundColor(Color("#999999"))
                                .font(.system(size:12))
                                .bold()
                                .cornerRadius(12)
                        }
                        
                    }
                    .padding(.trailing,20)
                    
                    
                    
                    TextField("00", text: $hour)
                        .padding(EdgeInsets(top:11, leading: 13.5, bottom: 11, trailing: 13.5))
                        .frame(width: 44,height: 44)
                        .background(.white)
                        .foregroundColor(Color("#999999"))
                        .font(.system(size:12))
                        .bold()
                        .cornerRadius(12)
                    
                    Text("시")
                        .font(.system(size:14))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.trailing,20)
                    
                    TextField("00", text: $Minute)
                        .padding(EdgeInsets(top:11, leading: 13.5, bottom: 11, trailing: 13.5))
                        .frame(width: 44,height: 44)
                        .background(.white)
                        .foregroundColor(Color("#999999"))
                        .font(.system(size:12))
                        .bold()
                        .cornerRadius(12)
                    
                    Text("분")
                        .font(.system(size:14))
                        .foregroundColor(.black)
                        .bold()

                }
                HStack{
                    Button(action: {
                        
                    }) {
                        Text("삭제")
                            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                            .background(Color("#FFD1D1"))
                            .foregroundColor(Color("#852121"))
                            .font(.system(size:12))
                            .bold()
                            .cornerRadius(12)
                    }
                    .padding(.trailing,12)
                    
                    Button(action: {
                        
                    }) {
                        Text("완료")
                            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                            .background(Color("#9BCFFF"))
                            .foregroundColor(Color("#404572"))
                            .font(.system(size:12))
                            .bold()
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

#Preview {
    ToDoEditSecondActionSheet(hour: "00", Minute: "00")
}


