//
//  MemberAPITestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/15/24.
//

import SwiftUI

struct MemberAPITestView: View {
    @ObservedObject var memberNetwork = MemberNetwork()
    
    @State var fileName = ""
    
    
    @State var updateOpenFile = false
    @State var updateSaveFile = false
    
    
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await memberNetwork.fetchDeleteMember()
                }
            } label: {
                Text("멤버 탈퇴")
            }
            
            VStack {
                Text("\n-------나의 프로필 수정(테스트 X)-------")
                
                Text(fileName)
                    .fontWeight(.bold)
                
                Button {
                    updateOpenFile.toggle()
                } label: {
                    Text("Open")
                }
                
                Button {
                    updateSaveFile.toggle()
                } label: {
                    Text("Save")
                }
            }// 앱 외부(디바이스)의 파일을 앱 내부로 가져와 데이터로 변환
            .fileImporter(isPresented: $updateOpenFile, allowedContentTypes: [.image]) { (res) in
                do {
                    let fileUrl = try res.get()
                    
                    guard fileUrl.startAccessingSecurityScopedResource() else {
                        // 권한을 얻지 못한 경우
                        print("Permission denied")
                        return
                    }
                    
                    defer {
                        // 파일 처리가 끝난 후 접근 권한 해제
                        fileUrl.stopAccessingSecurityScopedResource()
                    }
                    
                    print(fileUrl)
                    
                    let fileNameWithoutExtension = fileUrl.deletingPathExtension().lastPathComponent
                    print("File name without extension: \(fileNameWithoutExtension)")
                    let fileExtension = fileUrl.pathExtension
                    print("File extension: \(fileExtension)")
                    
                    self.fileName = fileUrl.lastPathComponent
                    
                    print("File extension: \(fileName)")
                    
                    let boundary = "Boundary-\(UUID().uuidString)"
                    //
                    let fileData = try Data(contentsOf: fileUrl)

                    
                    let fileInfo = FileInfo(data: fileData, fileName: fileNameWithoutExtension, mimeType: fileExtension)
                    
                    print("fileInfo: \(fileInfo)")
                    
                    Task {
                        await memberNetwork.fetchUpdateMyProfile(request: MemberRequest.UpdateMyProfile(name: "경경수", nickname: "리버버", statusMessage: "포항항") , profileImage: fileInfo)
                    }
                    
                } catch {
                    print("Error reading docs")
                    print(error.localizedDescription)
                }
            }
            // 앱 내부 파일을 앱 외부(디바이스)로 반출
            .fileExporter(isPresented: $updateSaveFile, document: Doc(url: Bundle.main.path(forResource: "audio", ofType: "mp3")!), contentType: .audio) { (res) in
                
                do {
                    let fileUrl = try res.get()
                    print(fileUrl)
                    let fileNameWithoutExtension = fileUrl.deletingPathExtension().lastPathComponent
                    print("File name without extension: \(fileNameWithoutExtension)")
                    let fileExtension = fileUrl.pathExtension
                    print("File extension: \(fileExtension)")
                } catch {
                    print("cannot save doc")
                    print(error.localizedDescription)
                }
            }
        }
        
    }
}

#Preview {
    MemberAPITestView()
}
