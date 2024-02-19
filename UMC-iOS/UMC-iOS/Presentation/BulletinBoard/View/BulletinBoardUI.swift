import SwiftUI

struct BulletinBoardUI: View {
    var background = "background_BB"
    @State private var isWritingListActive = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isBulletinBoardNoticeVisible = false
    @Binding var selectedButton1: Int?
    
    var body: some View {
        NavigationView {
            ZStack{
                // (중략)
                VStack(alignment: .leading) {
                    Spacer()
                    Spacer()
                    // 버튼
                    BulletinBoardButton(selectedButton1: $selectedButton1)
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
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}



struct BulletinBoardUI_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedButton1: Int? = 1
        BulletinBoardUI(selectedButton1: $selectedButton1)
    }
}


