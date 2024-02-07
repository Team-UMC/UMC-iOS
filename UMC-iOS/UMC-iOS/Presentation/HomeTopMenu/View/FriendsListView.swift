//
//  FriendsListView.swift
//  UMC-iOS
//
//  Created by 이태현 on 2/7/24.
//

import SwiftUI


struct FriendsListView:View {
    @Environment(\.dismiss) private var dismiss
    private var activateNow: Bool = true
    
    var body: some View {
        VStack(alignment: .leading){

            List{
                Section(header: Text("온라인-7")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color(.main2)),
                content: {
                    if activateNow{
                        ForEach(0..<5){ num in
                            ZStack(alignment: .leading){
                                ProfileListView(offline: !activateNow)
                                // 활동중 상태를 나타내는 녹색 원 추가
                                Circle ()
                                    .foregroundColor(.green)
                                    .frame(width: 8, height: 8)
                                    .offset(x: 27, y: 16) // 위치 조정
                            }
                            //List line 삭제
                            .listRowSeparator(.hidden)
                        }
                    }
                    
                })
                Section(header: Text("오프라인-48")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color(.main2)),
                content: {
                        ForEach(0..<5){ num in
                                ProfileListView(offline: true)
                                    //List line 삭제
                                    .listRowSeparator(.hidden)
                        
                    }
                    
                })
            }
            .listStyle(GroupedListStyle())
            .scrollContentBackground(.hidden)
            .padding()

        }
        .modifier(SettingBackButton(title: "친구 목록", onDismiss: { dismiss() }, showTrailingItem: false))
    }
    
    func ProfileListView(offline:Bool) -> some View{
        HStack{
            Image(systemName:"person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                
                .cornerRadius(50)
            VStack(alignment: .leading){
                HStack {
                    Text("델로/오정현")
                        .font(.system(size: 16, weight: .medium))
                    .foregroundColor(offline ? .buttonDisabled : .black)
                    Text("iOS 파트장")
                        .font(.system(size: 10, weight: .medium))
                        .frame(width: 58, height: 16)
                        .foregroundStyle(.main)
                        .background(.energy)
                        .cornerRadius(12)
                }
                
                Text("인하대학교 | 5기 | Design")
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(offline ? .buttonDisabled : .black.opacity(0.5))
            }
        }
    }
}

#Preview {
    FriendsListView()
}
