//
//  ToDoEditSheet.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/01/31.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ToDoEditSheet: View {
    var body: some View {
        Rectangle()
            .frame(width: 375, height: 191)
            .foregroundColor(Color("#F2F5FC"))
            .cornerRadius(20, corners: [.topLeft, .topRight])

            .padding()
    }
}

#Preview {
    ToDoEditSheet()
}

