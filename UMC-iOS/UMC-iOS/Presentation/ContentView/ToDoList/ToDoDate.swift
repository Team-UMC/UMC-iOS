//
//  TodoDate.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/30.
//

import SwiftUI

struct TodoDate: View {
    @State private var date = Date()
    @State private var isDatePickerPresented = false

    var body: some View {
        HStack {
            Image("CalenderIcon")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    isDatePickerPresented.toggle()
                }

            Text("\(formattedDate(date))")
                .foregroundColor(Color("searchPurple"))
                .font(.system(size: 16))
                .bold()

            Spacer()
        }
        .padding()
        .sheet(isPresented: $isDatePickerPresented) {
            VStack {
                DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.compact)
                .padding()
            }
        }
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

