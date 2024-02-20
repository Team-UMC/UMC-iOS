//
//  RankingTestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/20/24.
//

import SwiftUI

struct RankingTestView: View {
    
    //    @ObservedObject var viewModel = MascotRankingViewModel()
    //        @ObservedObject var universityNetwork = UniversityNetwork()
    //        @ObservedObject var memberNetwork = MemberNetwork()
    //
    @Binding var activeRankingOrContribution: Int
    //
    @State var universityRanks = UniversityResponse.GetUniversityRanks()
    @State var myUniversityRankDetail = UniversityResponse.GetUniverSityDetail()
    @State var memberRankInfo = MemberResponse.GetMemberRankInfo()
    @State var contributionRanking = UniversityResponse.GetContributionRankingInCampus()
    
    
    var mascot: String = "mascotImage2"
    //
    var body: some View {
        ZStack(alignment: .top) {
            
            //            RankingNavigationbar()
            Image("RankingBackground")
                .resizable()
                .scaledToFit()
                .padding(.top,-125)
            ScrollView {
                
                
                VStack {
                    //                    Spacer().frame(height: 60)
                    
                    
                    Spacer().frame(height: 20)
                    //
                    //타이틀
                    RankingTitle()
                    //
                    Spacer().frame(height: 50)
                    
                    HStack {
                        // 학교 버튼
                        Button {
                            activeRankingOrContribution = 1
                        } label: {
                            VStack {
                                Image(myUniversityRankDetail.universityName)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(.bottom,14)
                                    .clipShape(Circle())
                                
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
                        
                        Button {
                            activeRankingOrContribution = 2
                        } label: {
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
                    }
                    
                    Spacer().frame(height: 70)
                    
                    if activeRankingOrContribution == 1 {
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
                                Image("가톨릭대학교")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text("가톨릭대학교")
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
                        
                        VStack {
                            ForEach(universityRanks.joinUniversityRanks, id: \.self) { univ in
                                HStack {
                                    Spacer().frame(width: 20)
                                    Text("\(univ.universityRank)등")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(.main)
                                    Spacer()
                                    Text(univ.universityName)
                                        .font(.system(size: 16, weight: .medium))
                                    Spacer()
                                    Text("\(univ.universityPoint) points")
                                        .font(.system(size: 10))
                                    Spacer().frame(width: 20)
                                }
                                .frame(width: 310, height: 41)
                                .background {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.white)
                                        .shadow(color: .shadow60,radius: 5, y: 1)
                                }
                                .listRowInsets(.init(top: 20, leading: 30, bottom: 20, trailing: 30))
                                .cornerRadius(5)
//                                .listRowSeparator(.hidden)
                            }
                        }
                    } else if activeRankingOrContribution == 2 {
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
                            
                            VStack {
                                ForEach(universityRanks.joinUniversityRanks, id: \.self) { univ in
                                    HStack {
                                        Spacer().frame(width: 20)
                                        Text("\(univ.universityRank)등")
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundStyle(.main)
                                        Spacer()
                                        Text(univ.universityName)
                                            .font(.system(size: 16, weight: .medium))
                                        Spacer()
                                        Text("\(univ.universityPoint) points")
                                            .font(.system(size: 10))
                                        Spacer().frame(width: 20)
                                    }
                                    .frame(width: 310, height: 41)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.white)
                                            .shadow(color: .shadow60,radius: 5, y: 1)
                                    }
                                    .listRowInsets(.init(top: 20, leading: 30, bottom: 20, trailing: 30))
                                    .cornerRadius(5)
    //                                .listRowSeparator(.hidden)
                                }
                            }
                            
                            
                        }
                    }
                    
                }
            }
        }
        .onAppear {
            Task {
                myUniversityRankDetail = await UniversityNetwork.fetchGetUniversityDetail()
                universityRanks = await UniversityNetwork.fetchGetUniversityRanks()
                memberRankInfo = await MemberNetwork.fetchGetMemberRankInfo()
                contributionRanking = await UniversityNetwork.fetchGetContributionRankingInCampus()
            }
        }
    }
}

//#Preview {
//    RankingTestView()
//}
