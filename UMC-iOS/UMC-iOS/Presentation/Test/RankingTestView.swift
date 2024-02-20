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
    //
    var body: some View {
        ZStack(alignment: .top) {
            
            ScrollView {
                Image("RankingBackground")
                    .resizable()
                    .scaledToFit()
                    .padding(.top,-125)
                
                RankingNavigationbar()
                
                VStack {
                    Spacer().frame(height: 60)
                    
                    
                    Spacer().frame(height: 50)
                    Text("TET")
                    //
                    //타이틀
                    RankingTitle()
                    //
                    Spacer().frame(height: 20)
                }
                
                
            }
        }
    }
}

//#Preview {
//    RankingTestView()
//}
