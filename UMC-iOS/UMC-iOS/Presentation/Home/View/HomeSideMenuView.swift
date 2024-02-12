//
//  HomeSideMenuView.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/5/24.
//

import SwiftUI

//홈 슬라이드
struct HomeSideView:View {
    @Binding var isShowing: Bool
        var content: AnyView
        var direction: Edge
        
    var body: some View {
        ZStack(alignment: .topLeading) {
            if isShowing {
                Color.black
                    .opacity(0.05)
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .transition(.move(edge: direction))
                    .background(
                        Color.white
                    )
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .animation(.easeInOut, value: isShowing)
    }
}

//사이드 메뉴
struct SideMenuViewContents: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        HStack {
            ZStack {
                VStack(alignment: .leading){
                    HStack{
                        Spacer()
                        Button(action: {
                            presentSideMenu.toggle()
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundStyle(.black)
                        })
                        .padding(10)
                        .frame(width: 38, height: 38)
                    }
                    Spacer().frame(height: 16)
                    HStack{
                        HStack{
                            Image(systemName:"person.crop.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                
                                .cornerRadius(50)
                            VStack(alignment: .leading){
                                Text("델로")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black)
                                
                                Text("인하대학교")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black.opacity(0.5))
                            }
                        }
                        Spacer().frame(width: 56)
                        SideMenuNavigationButton(destination:UserProfileUI(), MenuName: "프로필", ImageName: "person.crop.circle.fill")
                        Spacer().frame(width: 16)
                        SideMenuNavigationButton(destination: UserProfileUI(), MenuName: "설정", ImageName: "gearshape.fill") //추후 구현
                    }
                    Spacer().frame(height: 20)
                    HStack(spacing: 32){
                        SideMenuNavigationButton(destination: WritingList(title: "", content: ""), MenuName: "글쓰기", ImageName: "pencil")
                        SideMenuNavigationButton(destination: UserProfileUI(), MenuName: "내글", ImageName: "doc.text.fill") //추후 구현
                        SideMenuNavigationButton(destination: UserProfileUI(), MenuName: "쪽지함", ImageName: "envelope.fill") //추후 구현
                        SideMenuNavigationButton(destination: RankingDetailView(), MenuName: "마스코드", ImageName: "pawprint.fill")
                    }
                    Spacer().frame(height: 32)
                    Text("즐겨찾기")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                    Spacer().frame(height: 25)
                    VStack(alignment: .leading, spacing: 20){
                        Text("공지사항")
                        Text("자유게시판")
                        Text("사진첩")
                        Text("프로젝트 매칭")
                        Text("네트워킹 게시판")
                        Text("연합 게시판")
                    }
                    .font(.system(size: 14))
                    .foregroundStyle(.black)
                    
                    Spacer().frame(height: 48)
                    Text("5명의 챌린저가 접속 중이에요!")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                    Spacer().frame(height: 24)
                    HStack{
                        Image(systemName:"person.crop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                            .cornerRadius(50)
                        
                        Text("더기/양유진")
                            .font(.system(size: 14))
                            .foregroundColor(.black.opacity(0.5))
                    }
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 55, leading: 17.5, bottom: 0, trailing: 30.5))
                .frame(width: 320)
            }
        }
    }
}
