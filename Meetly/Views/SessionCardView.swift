//
//  SessionCardView.swift
//  Meetly1
//
//  Created by Huda Almadi on 07/11/2025.
//
import SwiftUI

struct SessionCardView: View {
    let session: Session
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header Section
            VStack(alignment: .leading, spacing: 8) {
                Text(session.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(session.time)
                    .font(.footnote)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Image Section
            Image("Session")
                .resizable()
                .scaledToFill()
                .frame(width: 240, height: 240)
                .clipped()
                .cornerRadius(16)
        }
        .padding(20)
        .frame(width: 280, height: 360)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(24)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SessionCardView(session: Session(
            title: "Business model",
            time: "11:00–11:30 AM",
            imageName: "Session"
        ))
    }
}















//import SwiftUI
//
//struct SessionCardView: View {
//    let session: Session
//
//    var body: some View {
//        ZStack {
//            // خلفية الكارد
//            RoundedRectangle(cornerRadius: 35)
//                .fill(Color.black)
//                .frame(width: 260, height: 340)
//
//            VStack(alignment: .leading, spacing: 12) {
//                // العنوان
//                Text(session.title)
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//
//                // الوقت
//                Text(session.time)
//                    .font(.footnote)
//                    .padding(.vertical, 6)
//                    .padding(.horizontal, 10)
//                    .background(Color.blue)
//                    .cornerRadius(6)
//                    .foregroundColor(.white)
//
//                Spacer()
//
//                // الصورة تغطي الجزء السفلي مع زوايا ناعمة
//                ZStack {
//                    RoundedRectangle(cornerRadius: 30)
//                        .fill(Color.blue)
//                        .frame(height: 180)
//                    Image("Session")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 180)
//                        .cornerRadius(30)
//                }
//            }
//            .padding(20)
//            .frame(width: 260, height: 340)
//        }
//    }
//}

