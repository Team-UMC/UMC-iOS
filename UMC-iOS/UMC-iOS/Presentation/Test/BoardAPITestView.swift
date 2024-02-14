//
//  BoardAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/13/24.
//

import SwiftUI

struct BoardAPITestView: View {
    @ObservedObject var boardNetwork = BoardNetwork()
    @State private var deleteBoardId: String = ""
    @State private var getBoardDetailId: String = ""
    @State private var searchKeyword: String = ""
    @State private var heartBoardId: String = ""
    @State private var createBoardCommentId: String = ""
    @State private var updateBoardCommentId: String = ""
    @State private var deleteBoardCommentId: String = ""
    @State private var myBoardsSearchKeyword: String = ""
    
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
            
            TextField("삭제할 게시판 아이디를 입력하세요.", text: $deleteBoardId)
            
            Button {
                Task {
                    await boardNetwork.fetchDeleteBoard(request: BoardRequest.BoardId(boardId: deleteBoardId))
                }
            } label: {
                Text("게시판 삭제")
            }
            
            TextField("상세 조회할 게시판 아이디를 입력하세요.", text: $getBoardDetailId)
            
            Button {
                Task {
                    await boardNetwork.fetchGetBoardDetail(boardId: getBoardDetailId)
                }
            } label: {
                Text("게시판 상세 조회")
            }
            
            TextField("검색할 키워드를 입력하세요.", text: $searchKeyword)
            
            Button {
                Task {
                    await boardNetwork.fetchSearchBoards(keyword: searchKeyword, page: 0)
                }
            } label: {
                Text("게시글 검색")
            }
            
            TextField("좋아요/취소할 게시글 아이디를 입력하세요.", text: $heartBoardId)
            
            Button {
                Task {
                    await boardNetwork.fetchHeartBoard(boardId: heartBoardId)
                }
            } label: {
                Text("게시판 좋아요/취소")
            }
            
            TextField("댓글을 작성할 게시글 아이디를 입력하세요.", text: $createBoardCommentId)
            
            Button {
                Task {
                    await boardNetwork.fetchCreateBoardComment(request: BoardCommentRequest.CreateBoardComment(boardId: createBoardCommentId, content: "댓글111"))
                }
            } label: {
                Text("댓글 작성")
            }
            
            TextField("수정할 댓글 아이디를 입력하세요.", text: $updateBoardCommentId)
            
            Button {
                Task {
                    await boardNetwork.fetchUpdateBoardComment(commentId: updateBoardCommentId, request: BoardCommentRequest.UpdateBoardComment(content: "댓글 수정정"))
                }
            } label: {
                Text("댓글 수정")
            }
            
            TextField("삭제할 댓글 아이디를 입력하세요.", text: $deleteBoardCommentId)
            
            Button {
                Task {
                    await boardNetwork.fetchDeleteBoardComment(commentId: deleteBoardCommentId)
                }
            } label: {
                Text("댓글 삭제")
            }
            
            TextField("검색할 키워드를 입력하세요.", text: $myBoardsSearchKeyword)
            
            Button {
                Task {
                    await boardNetwork.fetchGetMyBoards(keyword: myBoardsSearchKeyword, page: 0)
                }
            } label: {
                Text("내가 쓴 게시글 조회/검색")
            }
        }
    }
}

#Preview {
    BoardAPITestView()
}
