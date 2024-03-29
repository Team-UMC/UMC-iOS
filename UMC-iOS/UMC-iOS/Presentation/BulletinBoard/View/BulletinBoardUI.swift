import SwiftUI

struct BulletinBoardUI: View {
    var background = "background_BB"
    @State private var isWritingListActive = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isBulletinBoardNoticeVisible = false
    var body: some View {
        NavigationView {
            
            ZStack{
                ZStack {
                    
                    // 배경
                    Image(background)
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    
                    
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Spacer()
                        //버튼
                        BulletinBoardButton()
                            .padding(.top,50)
                            .padding(.leading,30)
                            .padding(.bottom,30)
                        
                        // 게시글 리스트
                        BulletinBoardList()
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                    }
                    Spacer()
                    
                    Button(action: {
                        isWritingListActive.toggle()
                    }) {
                        Image("TILButton")
                            .resizable()
                            .frame(width: 46, height: 46)
                            .padding(.top, 600)
                            .padding(.leading, 300)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .navigationDestination(isPresented: $isWritingListActive) {
                        WritingList(title: "", content: "")
                    }
                    
                }
                VStack{
                    
                    Spacer()
                    
                    
                    
                }
                
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct BulletinBoardUI_Previews: PreviewProvider {
    static var previews: some View {
        BulletinBoardUI()
    }
}


