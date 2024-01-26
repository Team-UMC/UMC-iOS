//
//  ContentView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    var body: some View {
        NavigationStack{
            VStack {
                Button(action: {
                    isPressed.toggle()
                }, label: {Image(systemName: "hammer.fill")
                })
                .navigationDestination(isPresented: $isPressed){ ManagerSetting()}
                
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

