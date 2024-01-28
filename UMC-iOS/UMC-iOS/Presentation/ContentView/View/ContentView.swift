//
//  ContentView.swift
//  UMC-iOS
//
//  Created by Kyungsoo Lee on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    @State var presentSideMenu = false

    
    var body: some View {
        NavigationStack{
            ZStack{
                HomeSideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
                    .zIndex(1)
                
                VStack(alignment: .leading){
                    Button {
                        presentSideMenu.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "line.3.horizontal")
                            Text("Show Menu")
                        }
                    }
                    HStack{
                        Button(action: {
                            isPressed.toggle()
                        }, label: {Image(systemName: "hammer.fill")
                        })
                        .navigationDestination(isPresented: $isPressed){ ManagerSetting()}
                        Button(action: {
                            isPressed.toggle()
                        }, label: {Image(systemName: "person.2.fill")
                        })
                        .navigationDestination(isPresented: $isPressed){ FriendsListView()}
                    }
                    
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, worldsdfsdfsdfsdfsdfsdfsd!")
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}

