//
//   IndividualMentorCardView.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//

import SwiftUI

struct AvatarView: View {
    let imageName: String
    var size: CGFloat = 64

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(1, contentMode: .fill)
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white.opacity(0.15), lineWidth: 1)
            )
    }
}

struct IndividualMentorCardView: View {
    let mentor: Mentor
    var onBook: () -> Void
    private var isAvailable: Bool { mentor.status == .available }

    var body: some View {
        VStack(spacing: 0) {
            // الصورة والاسم
            HStack(spacing: 16) {
                AvatarView(imageName: mentor.imageName, size: 64)
                Text(mentor.name)
                    .font(.custom("BeVietnamPro-Bold", size: 16))
                    .foregroundColor(.appText)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 18)
            .padding(.bottom, 14)

            // الخط الفاصل
            Rectangle()
                .fill(Color.white.opacity(0.06))
                .frame(height: 1)
                .padding(.horizontal, 12)

            // الزر
            Button {
                if isAvailable { onBook() }
            } label: {
                Text("Book now")
                    .font(.custom("BeVietnamPro-Bold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .background(isAvailable ? Color.appButtonBlue : Color.gray.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 14)
            }
            .disabled(!isAvailable)
        }
        .background(
            RoundedRectangle(cornerRadius: 26)
                .fill(Color.appCard)
        )
        .padding(.horizontal, 4)
        .shadow(color: .black.opacity(0.35), radius: 10, x: 0, y: 6)
    }
}
