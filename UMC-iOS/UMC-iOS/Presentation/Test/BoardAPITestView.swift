//
//  BoardAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import SwiftUI

struct BoardAPITestView: View {
    @ObservedObject var boardNetwork = BoardNetwork()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await boardNetwork.fetchGetSpecificBoards(host: "CENTER", board: "NOTICE", page: 0)
                }
            } label: {
                Text("특정 게시판의 게시글 목록 조회")
            }
            
            Button {
                Task {
                    await boardNetwork.fetchCreateBoard(request: BoardRequest.CreateBoard(title: "TEST", content: "TEST", host: "CENTER", board: "NOTICE"), files: [])
                }
            } label: {
                Text("게시판 작성")
            }
        }
    }
}

#Preview {
    BoardAPITestView()
}
