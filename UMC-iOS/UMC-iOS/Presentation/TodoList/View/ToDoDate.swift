//
//  TodoDate.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/30.
//

import SwiftUI

struct TodoDate: View {
    @State private var date = Date()

    var body: some View {
        HStack {
            Spacer()
            Image("CalenderIcon")
                .resizable()
                .frame(width: 24, height: 24)
               
            DatePicker(
                "",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.compact)
            .labelsHidden()
            .foregroundColor(Color("searchPurple"))

            Spacer()
        }
        .padding(.trailing,190)
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
}



struct TodoDate_Previews: PreviewProvider {
    static var previews: some View {
        TodoDate()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

