//
//  FileUploadTestView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 2/14/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct FileUploadTestView: View {
    
    @State var fileName = ""
    @State var openFile = false
    @State var saveFile = false
    @ObservedObject var boardNetwork = BoardNetwork()
    
    @EnvironmentObject var socialLoginViewModel: SocialLoginViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    
    var body: some View {
        VStack {
            Text(fileName)
                .fontWeight(.bold)
            
            Button {
                openFile.toggle()
            } label: {
                Text("Open")
            }
            
            Button {
                saveFile.toggle()
            } label: {
                Text("Save")
            }
        }
        // 앱 외부(디바이스)의 파일을 앱 내부로 가져와 데이터로 변환
        .fileImporter(isPresented: $openFile, allowedContentTypes: [.pdf]) { (res) in
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
//                
//                
//                let sendData = Data.createFileData(boundary: boundary, data: fileData, mimeType: fileExtension, fileName: fileNameWithoutExtension)
                
                let fileInfo = BoardNetwork.FileInfo(data: fileData, fileName: fileNameWithoutExtension, mimeType: fileExtension)
                
                print("fileInfo: \(fileInfo)")
                
                Task {
                     await boardNetwork.fetchCreateBoard(request: BoardRequest.CreateBoard(title: "TEST", content: "TEST", host: "CENTER", board: "NOTICE"), files: [fileInfo])
                }
                
            } catch {
                print("Error reading docs")
                print(error.localizedDescription)
            }
        }
        // 앱 내부 파일을 앱 외부(디바이스)로 반출
        .fileExporter(isPresented: $saveFile, document: Doc(url: Bundle.main.path(forResource: "audio", ofType: "mp3")!), contentType: .audio) { (res) in
            
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

struct Doc: FileDocument {
    
    var url: String
    
    static var readableContentTypes: [UTType]{[.audio]}
    
    
    init(url: String) {
        
        self.url = url
        
    }
    
    init(configuration: ReadConfiguration) throws {
        
        url = ""
        
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        
        let file = try! FileWrapper(url: URL(fileURLWithPath: url), options: .immediate)
        
        return file
        
    }
}


#Preview {
    FileUploadTestView()
        .environmentObject(SocialLoginViewModel())
        .environmentObject(LoginViewModel())
}
