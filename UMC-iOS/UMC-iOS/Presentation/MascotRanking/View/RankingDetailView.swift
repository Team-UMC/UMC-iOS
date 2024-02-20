//
//  RankingDetailView.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI

struct RankingDetailView:View {
//    @Environment(\.dismiss) private var dismiss
    @Binding var activeRankingOrContribution: Int
//    var user = Member()
//    var univ = University()
    
    @ObservedObject var viewModel = MascotRankingViewModel()
//    @ObservedObject var memberNetwork = MemberNetwork()
    
    @State var universityRanks = UniversityResponse.GetUniversityRanks()
    @State var myUniversityRankDetail = UniversityResponse.GetUniverSityDetail()
    @State var memberRankInfo = MemberResponse.GetMemberRankInfo()
    
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
                
//                RankingNavigationbar()
                
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
                            Image(myUniversityRankDetail.universityName)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .padding(.bottom,14)
                            
                            Text("**\(myUniversityRankDetail.universityName)** 는\n**\(myUniversityRankDetail.universityPoint)**포인트로\n현재 **\(myUniversityRankDetail.universityRank)**등이에요 👏")
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 12))
                        }
                        .frame(width: 150, height: 200)
                        .background(activeRankingOrContribution == 1 ? Color.main2 : Color.white)
                        .foregroundColor(activeRankingOrContribution == 1 ? .white : .black)
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
                                .foregroundStyle(activeRankingOrContribution == 1 ? .black : .grayDivider)
                            ,alignment: .top
                        )
                    }
                    .shadow(color: .shadow60,radius: 2, y: 2)
                    .padding(.trailing,24)
                    
                    // 개인 기여도 선택 버튼
                    Button(action: {
                        activeRankingOrContribution = 2
                        Task {
                            memberRankInfo = await MemberNetwork.fetchGetMemberRankInfo()
                        }
                    }) {
                        VStack {
                            AsyncImage(url: URL(string: memberRankInfo.profileImage ?? "")) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .padding(.bottom,14)
                            } placeholder: {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .padding(.bottom,14)
                            }
                                
                            
                            Text("**\(memberRankInfo.nickname)** 님은\n**\(memberRankInfo.contributionPoint)** 기여도로\n현재 **\(memberRankInfo.contributionRank)**등이에요 👏")
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 12))
                        }
                        .frame(width: 150, height: 200)
                        .foregroundColor(activeRankingOrContribution == 2 ? .white : .black)
                        .background(activeRankingOrContribution == 2 ? Color.main2 : Color.white)
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
                                .foregroundStyle(activeRankingOrContribution == 2 ? .black : .grayDivider)
                            ,alignment: .top
                        )
                    }
                    .shadow(color: .shadow60,radius: 2, y: 2)
                }
                Spacer().frame(height: 70)
                
                // 현재 선택에 따라 조건부 내용 표시
                if activeRankingOrContribution == 1 {
                    // 학교 랭킹 리스트
                    HStack(alignment: .bottom){
                        
                        //랭킹 2등
                        VStack{
                            Text("2등")
                                .padding(4)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundStyle(.main)
                                .background(.energy)
                                .cornerRadius(12)
                                .padding(4)
                            Image("카톨릭대학교")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            Text("카톨릭대학교")
                                .font(.system(size: 16, weight: .semibold))
                            Text("100")
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
                            Text("1등")
                                .padding(4)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundStyle(.main)
                                .background(.energy)
                                .cornerRadius(12)
                                .padding(4)
                            Image("인하대학교")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            Text("인하대학교")
                                .font(.system(size: 16, weight: .semibold))
                            Text("500")
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
                            Text("3등")
                                .padding(4)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundStyle(.main)
                                .background(.energy)
                                .cornerRadius(12)
                                .padding(4)
                            Image("숭실대학교")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            Text("숭실대학교")
                                .font(.system(size: 16, weight: .semibold))
                            Text("100")
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
//                    List(viewModel.schoolRankings) { ranking in
//                        if (ranking.rank > 3){
//                            HStack {
//                                Text("\(ranking.rank)등")
//                                    .font(.system(size: 16, weight: .medium))
//                                    .foregroundStyle(.main)
//                                Spacer()
//                                Text(ranking.name)
//                                    .font(.system(size: 16, weight: .medium))
//                                
//                                Spacer()
//                                Text("\(ranking.points) points")
//                                    .font(.system(size: 10))
//                            }
//                            .frame(width: 310, height: 41)
//                            .listRowBackground(
//                                RoundedRectangle(cornerRadius: 12)
//                                    .fill(.white)
//                                    .padding(.vertical, 8)
//                                    .padding(.horizontal, 6)
//                                    .shadow(color: .shadow60,radius: 5, y: 1)
//                                
//                            )
//                            .cornerRadius(12)
//                            .listRowSeparator(.hidden)
//                            .listRowInsets(.init(top: 11, leading: 24, bottom: 11, trailing: 23))
//                        }
//                    }
//                    .scrollContentBackground(.hidden)
                } else {
                    // 나의 기여도 리스트
                    HStack(alignment: .bottom){
                        //랭킹 2등
                        VStack{
                            Text("2등")
                                .font(.system(size: 10, weight: .medium))
                                .frame(width: 20, height: 16)
                                .foregroundStyle(.main)
                                .background(.energy)
                                .cornerRadius(12)
                                .padding(4)
//                            Image("이경수")
//                                .resizable()
//                                .frame(width: 30, height: 30)
//                                .clipShape(Circle())
                            Text("이경수")
                                .font(.system(size: 16, weight: .semibold))
                            Text("100")
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
                            Text("1등")
                                .font(.system(size: 10, weight: .medium))
                                .frame(width: 20, height: 16)
                                .foregroundStyle(.main)
                                .background(.energy)
                                .cornerRadius(12)
                                .padding(4)
//                            Image(viewModel.myContributions[0].name)
//                                .resizable()
//                                .frame(width: 30, height: 30)
//                                .clipShape(Circle())
                            Text("이경수")
                                .font(.system(size: 16, weight: .semibold))
                            Text("400")
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
                            Text("3등")
                                .font(.system(size: 10, weight: .medium))
                                .frame(width: 20, height: 16)
                                .foregroundStyle(.main)
                                .background(.energy)
                                .cornerRadius(12)
                                .padding(4)
//                            Image(viewModel.myContributions[2].name)
//                                .resizable()
//                                .frame(width: 30, height: 30)
//                                .clipShape(Circle())
                            Text("이경수")
                                .font(.system(size: 16, weight: .semibold))
                            Text("400point")
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
//                    List(viewModel.myContributions) { contribution in
//                        if (contribution.rank > 3){

//                    }
//                    .scrollContentBackground(.hidden)
                }
                
            }
//            .modifier(SettingBackButton(title: "랭킹", onDismiss: { dismiss() }, showTrailingItem: false))            
//            .ignoresSafeArea()
        } // ScrollView
        .background(Color.background)
        .onAppear {
            if activeRankingOrContribution == 1 {
                viewModel.selectedRanking = .school
            } else {
                viewModel.selectedRanking = .personal
            }
            Task {
                universityRanks = await UniversityNetwork.fetchGetUniversityRanks()
                memberRankInfo = await MemberNetwork.fetchGetMemberRankInfo()
                myUniversityRankDetail = await UniversityNetwork.fetchGetUniversityDetail()
            }
        }
    }
}
//}

//#Preview {
//    RankingDetailView()
//}
