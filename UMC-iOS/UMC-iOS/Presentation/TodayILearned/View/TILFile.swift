//
//  TILFile.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/01.
//

import SwiftUI

struct TILFile: View {
    @State var name: String = ""
    @ObservedObject var viewModel = FileAttachmentViewModel()
    var body: some View {
        Text(name)
            .font(.system(size:12))
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .foregroundColor(Color("searchPurple"))
            .background(Color("#F0F4FF"))
            .cornerRadius(12)
            
        
    }
}

//#Preview {
//    TILFile(name: "file name")
//}

