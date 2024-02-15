//
//  RankingDetailView.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI

struct RankingDetailView:View {
    @Environment(\.dismiss) private var dismiss
    var user = Member()
    var univ = University()
    
    @ObservedObject var viewModel = MascotRankingViewModel()
    
    var UnivRank: Int = 1
    var UserRank: Int = 4
    var mascot: String = "mascotImage2"
    
    var body: some View {
       // ScrollView {
            //배경
            ZStack(alignment: .top){
                Image("RankingBackground")
                    .resizable()
                    .scaledToFit()
                    .padding(.top,-70)
                    
                
                VStack{
                    Spacer().frame(height: 60)
                    
                    RankingNavigationbar()
                    
                    Spacer().frame(height: 20)
                    
                    //타이틀
                    RankingTitle()
                    
                    Spacer().frame(height: 50)
                    
                    
                    HStack {
                        
                        // 학교 랭킹 선택 버튼
                        Button(action: {
                            self.viewModel.selectedRanking = .school
                        }) {
                            VStack {
                                Image(univ.universityLogo)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .padding(.bottom,14)
                                
                                Text("**\(user.university)**\n**\(univ.totalPoint)**포인트로\n현재 **\(UnivRank)**등이에요 👏")
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 12))
                            }
                            .frame(width: 150, height: 200)
                            .background(viewModel.selectedRanking == .school ? Color.main2 : Color.white)
                            .foregroundColor(viewModel.selectedRanking == .school ? .white : .black)
                            .cornerRadius(12)
                            
                            //상단 학교랭킹 텍스트와 학사모 이미지
                            .overlay(
                                VStack{
                                    Image(systemName: "graduationcap.fill")
                                        .resizable()
                                        .frame(width: 24,height: 24)
                                        .padding(6)
                                        .background(.white)
                                        .clipShape(Circle())
                                    Text("학교 랭킹")
                                        .font(.system(size: 12, weight: .medium))
                                        .frame(width: 80,height: 20)
                                        .background(.white)
                                        .cornerRadius(12)
                                        .offset(y:-14)
                                }
                                    .offset(y:-35)
                                    .foregroundStyle(viewModel.selectedRanking == .school ? .black : .grayDivider)
                                ,alignment: .top
                            )
                        }
                        .shadow(color: .shadow60,radius: 2, y: 2)
                        .padding(.trailing,24)
                        
                        // 개인 기여도 선택 버튼
                        Button(action: {
                            self.viewModel.selectedRanking = .personal
                        }) {
                            VStack {
                                Image(user.profileImage)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .padding(.bottom,14)
                                
                                Text("**\(user.name)** 님은\n**\(user.contributionPoint)** 기여도로\n현재 **\(UserRank)**등이에요 👏")
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 12))
                            }
                            .frame(width: 150, height: 200)
                            .foregroundColor(viewModel.selectedRanking == .personal ? .white : .black)
                            .background(viewModel.selectedRanking == .personal ? Color.main2 : Color.white)
                            .cornerRadius(12)
                            //상단 개인기여도랭킹 텍스트와 메달 이미지
                            .overlay(
                                VStack{
                                    Image(systemName: "medal.fill")
                                        .resizable()
                                        .frame(width: 24,height: 24)
                                        .padding(6)
                                        .background(.white)
                                        .clipShape(Circle())
                                    Text("나의 기여도")
                                        .font(.system(size: 12, weight: .medium))
                                        .frame(width: 80,height: 20)
                                        .background(.white)
                                        .cornerRadius(12)
                                        .offset(y:-14)
                                }
                                    .offset(y:-35)
                                    .foregroundStyle(viewModel.selectedRanking == .personal ? .black : .grayDivider)
                                ,alignment: .top
                            )
                        }
                        .shadow(color: .shadow60,radius: 2, y: 2)
                    }
                    Spacer().frame(height: 70)
                    
                    // 현재 선택에 따라 조건부 내용 표시
                    if viewModel.selectedRanking == .school {
                        // 학교 랭킹 리스트
                        HStack(alignment: .bottom){
                            
                            //랭킹 2등
                            VStack{
                                Text("\(viewModel.schoolRankings[1].rank)등")
                                    .padding(4)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundStyle(.main)
                                    .background(.energy)
                                    .cornerRadius(12)
                                    .padding(4)
                                Image(viewModel.schoolRankings[1].name)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("\(viewModel.schoolRankings[1].name)")
                                    .font(.system(size: 16, weight: .semibold))
                                Text("\(viewModel.schoolRankings[1].points)")
                                    .font(.system(size: 12))
                                
                            }
                            .frame(width: 98, height: 140)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(Image(mascot)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(y: -50),
                                     alignment: .top)
                            .shadow(color: .shadow60,radius: 2, y: 2)
                            
                            
                            //랭킹 1등
                            VStack{
                                Text("\(viewModel.schoolRankings[0].rank)등")
                                    .padding(4)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundStyle(.main)
                                    .background(.energy)
                                    .cornerRadius(12)
                                    .padding(4)
                                Image(viewModel.schoolRankings[0].name)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("\(viewModel.schoolRankings[0].name)")
                                    .font(.system(size: 16, weight: .semibold))
                                Text("\(viewModel.schoolRankings[0].points)")
                                    .font(.system(size: 12))
                                
                            }
                            .frame(width: 98, height: 162)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(Image(mascot)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(y: -50),
                                     alignment: .top)
                            .shadow(color: .shadow60,radius: 2, y: 2)
                            
                            
                            //랭킹 3등
                            VStack{
                                Text("\(viewModel.schoolRankings[2].rank)등")
                                    .padding(4)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundStyle(.main)
                                    .background(.energy)
                                    .cornerRadius(12)
                                    .padding(4)
                                Image(viewModel.schoolRankings[2].name)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("\(viewModel.schoolRankings[2].name)")
                                    .font(.system(size: 16, weight: .semibold))
                                Text("\(viewModel.schoolRankings[2].points)")
                                    .font(.system(size: 12))
                                
                                
                            }
                            .frame(width: 98, height: 125)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(Image(mascot)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(y: -50),
                                     alignment: .top)
                            .shadow(color: .shadow60,radius: 2, y: 2)
                            
                            
                        }
                        List(viewModel.schoolRankings) { ranking in
                            if (ranking.rank > 3){
                                HStack {
                                    Text("\(ranking.rank)등")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(.main)
                                    Spacer()
                                    Text(ranking.name)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    Text("\(ranking.points) points")
                                        .font(.system(size: 10))
                                }
                                .frame(width: 310, height: 41)
                                .listRowBackground(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.white)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 6)
                                        .shadow(color: .shadow60,radius: 5, y: 1)
                                    
                                )
                                .cornerRadius(12)
                                .listRowSeparator(.hidden)
                                .listRowInsets(.init(top: 11, leading: 24, bottom: 11, trailing: 23))
                            }
                        }
                        .scrollContentBackground(.hidden)
                    } else {
                        // 나의 기여도 리스트
                        HStack(alignment: .bottom){
                            //랭킹 2등
                            VStack{
                                Text("\(viewModel.myContributions[1].rank)등")
                                    .font(.system(size: 10, weight: .medium))
                                    .frame(width: 20, height: 16)
                                    .foregroundStyle(.main)
                                    .background(.energy)
                                    .cornerRadius(12)
                                    .padding(4)
                                Image(viewModel.myContributions[1].name)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("\(viewModel.myContributions[1].name)")
                                    .font(.system(size: 16, weight: .semibold))
                                Text("\(viewModel.myContributions[1].points)point")
                                    .font(.system(size: 12))
                            }
                            .frame(width: 98, height: 140)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(Image(mascot)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(y: -50),
                                     alignment: .top)
                            .shadow(color: .shadow60,radius: 2, y: 2)
                            //랭킹 1등
                            VStack{
                                Text("\(viewModel.myContributions[0].rank)등")
                                    .font(.system(size: 10, weight: .medium))
                                    .frame(width: 20, height: 16)
                                    .foregroundStyle(.main)
                                    .background(.energy)
                                    .cornerRadius(12)
                                    .padding(4)
                                Image(viewModel.myContributions[0].name)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("\(viewModel.myContributions[0].name)")
                                    .font(.system(size: 16, weight: .semibold))
                                Text("\(viewModel.myContributions[0].points)point")
                                    .font(.system(size: 12))
                                
                            }
                            .frame(width: 98, height: 162)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(Image(mascot)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(y: -50),
                                     alignment: .top)
                            .shadow(color: .shadow60,radius: 2, y: 2)
                            
                            
                            //랭킹 3등
                            VStack{
                                Text("\(viewModel.myContributions[2].rank)등")
                                    .font(.system(size: 10, weight: .medium))
                                    .frame(width: 20, height: 16)
                                    .foregroundStyle(.main)
                                    .background(.energy)
                                    .cornerRadius(12)
                                    .padding(4)
                                Image(viewModel.myContributions[2].name)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("\(viewModel.myContributions[2].name)")
                                    .font(.system(size: 16, weight: .semibold))
                                Text("\(viewModel.myContributions[2].points)point")
                                    .font(.system(size: 12))
                            }
                            .frame(width: 98, height: 125)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(Image(mascot)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(y: -50),
                                     alignment: .top)
                            .shadow(color: .shadow60,radius: 2, y: 2)
                            
                        }
                        List(viewModel.myContributions) { contribution in
                            if (contribution.rank > 3){
                                HStack {
                                    Text("\(contribution.rank)등")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(.main)
                                    Spacer()
                                    Text(contribution.name)
                                        .font(.system(size: 16, weight: .medium))
                                    Spacer()
                                    Text("\(contribution.points) points")
                                        .font(.system(size: 10))
                                }
                                .frame(width: 310, height: 41)
                                .listRowBackground(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.white)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 6)
                                        .shadow(color: .shadow60,radius: 5, y: 1)
                                )
                                .listRowInsets(.init(top: 11, leading: 24, bottom: 11, trailing: 23))
                                .cornerRadius(12)
                                .listRowSeparator(.hidden)
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                    
                }
                .modifier(SettingBackButton(title: "랭킹", onDismiss: { dismiss() }, showTrailingItem: false))            .ignoresSafeArea()
            } // ScrollView
            .background(Color.background)
        }
    }
//}

#Preview {
    RankingDetailView()
}
