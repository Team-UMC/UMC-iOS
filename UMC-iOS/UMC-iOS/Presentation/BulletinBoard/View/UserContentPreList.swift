import SwiftUI
import Combine

struct UserContentPreList: View {
    @ObservedObject var viewModel = UserContentPreListViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(viewModel.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.clear))

                Text("\(viewModel.userNickname)/\(viewModel.userName)")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                Spacer()

                Text("\(viewModel.timeline)분전")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.horizontal, 21)
            }

            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(viewModel.contentTitle)")
                        .foregroundColor(.black)
                        .font(.system(size: 14).bold())

                    Text("\(viewModel.contentPreview)").lineLimit(2)
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                }

                Image(viewModel.contentImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56)
            }

            HStack {
                Image("LikeIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing, -4)
                Text("\(viewModel.likeCount)")
                    .foregroundColor(Color(red: 135/255, green: 132/255, blue: 255/255))
                    .font(.system(size: 12))
                    .padding(.trailing, 6)

                Image("ConmentIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing, -4)
                Text("\(viewModel.commentCount)")
                    .foregroundColor(Color(red: 1.0, green: 199/255, blue: 0))
                    .font(.system(size: 12))
                    .padding(.trailing, 6)

                Image("ViewingIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 13.91, height: 12.41)
                    .padding(.trailing, -2)
                Text("\(viewModel.viewingCount)")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .padding(.trailing, 6)
            }
        }
        .padding(.horizontal, 21)
        .onAppear {
            // 뷰가 나타날 때 데이터를 가져오도록 설정
            viewModel.fetchDataFromServer()
        }
    }
}

struct UserContentPreList_Previews: PreviewProvider {
    static var previews: some View {
        UserContentPreList()
    }
}
