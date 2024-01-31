import SwiftUI

struct IconWithText: View {
    var imageName: String
    var text: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 19.5, height: 19.5)
            Text(text)
                .font(.system(size: 12))
        }
    }
}

struct ToDoEditFirstActionSheet: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.clear
                    ToDoEditSheet()

                    HStack(spacing: 52) {
                        NavigationLink(destination: ToDoEditSecondActionSheet(hour: "00", Minute: "00")) {
                            IconWithText(imageName: "ClockIcon", text: "시간 설정")
                        }

                        Button(action: {
                            // Action for the "수정하기" button
                        }) {
                            IconWithText(imageName: "EditIcon", text: "수정하기")
                        }

                        Button(action: {
                            // Action for the "삭제하기" button
                        }) {
                            IconWithText(imageName: "DeleteIcon", text: "삭제하기")
                        }
                    }
                    .foregroundColor(Color("textColor"))
                    .padding()
                }
                
            }
            .background(Color(.clear))
        }
        .navigationBarHidden(true)
    }
}

struct ToDoEditFirstActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ToDoEditFirstActionSheet()
    }
}


