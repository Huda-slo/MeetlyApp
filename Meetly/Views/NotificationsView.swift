//
//  NotificationsView.swift
//  Meetly1
//
//  Created by Huda Almadi on 07/11/2025.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Text("Notification")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Color.clear.frame(width: 24, height: 24)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                Spacer()
                
                VStack(spacing: 30) {
                    Image("noti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipped()
                    
                    Text("You haven't scheduled any\nmeetings yet")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .regular))
                        .lineSpacing(5)
                }
                
                Spacer()
            }
        }
    }
}

//import SwiftUI
//
//// MARK: - Helpers
//extension Color {
//    init(hexString: String) {
//        let scanner = Scanner(string: hexString)
//        _ = scanner.scanString("#")
//        var rgb: UInt64 = 0
//        scanner.scanHexInt64(&rgb)
//        let r = Double((rgb >> 16) & 0xFF) / 255.0
//        let g = Double((rgb >> 8) & 0xFF) / 255.0
//        let b = Double(rgb & 0xFF) / 255.0
//        self.init(red: r, green: g, blue: b)
//    }
//}
//
//// MARK: - Notification
//struct Notification: View {
//    @Environment(\.dismiss) private var dismiss
//    private let blueColor = Color(hexString: "0A5CFE")
//    
//    var body: some View {
//        ZStack {
//            Color(hexString: "0D0D0D")
//                .ignoresSafeArea()
//            
//            VStack(spacing: 0) {
//                HStack {
//                    Button(action: { dismiss() }) {
//                        Image(systemName: "chevron.left.circle.fill")
//                            .font(.system(size: 24))
//                            .foregroundColor(blueColor)
//                    }
//                    
//                    Spacer()
//                    
//                    Text("Notification")
//                        .font(.system(size: 18, weight: .semibold))
//                        .foregroundColor(.white)
//                    
//                    Spacer()
//                    
//                    Color.clear.frame(width: 24, height: 24)
//                }
//                .padding(.horizontal, 20)
//                .padding(.top, 20)
//                
//                Spacer()
//                
//                VStack(spacing: 30) {
//                    Image("image2")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150, height: 150)
//                        .clipped()
//                    
//                    Text("You haven't scheduled any\nmeetings yet")
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(Color(hexString: "626262"))
//                        .font(.system(size: 18, weight: .regular))
//                        .lineSpacing(5)
//                }
//                
//                Spacer()
//            }
//        }
//    }
//}
//
//// MARK: - Preview
//#Preview {
//    Notification()
//}
