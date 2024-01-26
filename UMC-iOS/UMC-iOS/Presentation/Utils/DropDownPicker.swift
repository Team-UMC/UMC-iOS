//
//  DropDownPicker.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/10/24.
//

import SwiftUI

enum DropDownPickerState {
    case top
    case bottom
}

struct DropDownPicker: View {
    
    @Binding var selection: String?
    var state: DropDownPickerState = .bottom
    var options: [String]
    var maxWidth: CGFloat = 272
    var height: CGFloat = 40
    var minHeight: CGFloat = 500
    var fontSize: CGFloat = 18
    var placeholder: String = ""
    var BackColor: Color = .white
    var TextColor: Color = .black
    var border: Bool = true
    
    @State var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack(spacing: 0) {
                
                if state == .top && showDropdown {
                    OptionsView()
                }
                
                HStack {
                    Spacer()
                    
                    Text(selection == nil ? placeholder : selection!)
                        .foregroundColor(TextColor)
                        .multilineTextAlignment(.center)
                        .font(.system(size: fontSize))
                    
                    Spacer(minLength: 2)
                    
                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                        .font(.system(size: fontSize))
                        .foregroundColor(TextColor)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: maxWidth, height: height)
                .background(BackColor)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                                
                if state == .bottom && showDropdown {
                    OptionsView()
                }
            }
            .clipped()
            .background(BackColor)
            .cornerRadius(12)
            .overlay (
                Group{
                    if border{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray)
                    }
                }
            )
            .frame(height: size.height, alignment: state == .top ? .bottom : .top)
            
        }
        .frame(width: maxWidth, height: height)
        .zIndex(zindex)
    }
    
    
    func OptionsView() -> some View {
        VStack{
            ScrollView{
                HStack{
                    Spacer()
                    VStack(spacing: 0) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .multilineTextAlignment(.center)
                                .font(.system(size: fontSize))
                                .foregroundStyle(TextColor)
                                .animation(.none, value: selection)
                                .frame(height: height)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        selection = option
                                        showDropdown.toggle()
                                    }
                                }
                        }
                    }
                    Spacer()
                }
            }
            .frame(minHeight: minHeight)
            
        }
        .transition(.move(edge: state == .top ? .bottom : .top))
        .zIndex(1)
    }
}
