//
//  ServiceButtonView.swift
//  Meetly1
//
//  Created by Huda Almadi on 07/11/2025.
//

import SwiftUI

struct ServiceButtonView: View {
    let service: Service
    var body: some View {
            VStack(spacing: 6) {
                Text(service.title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(service.colorName == "Blue" ? .white : Color.blue)
                
                Text(service.subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(service.colorName == "Blue" ? .white.opacity(0.8) : .white.opacity(0.7))
            }
            .frame(width: 150, height: 70)
            .background(
                ZStack {
                    if service.colorName == "Blue" {
                        Color.blue
                    } else {
                        Color.black
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    }
                }
            )
            .cornerRadius(18)
            .frame(maxWidth: .infinity, alignment: .trailing) // يمين الصفحة
        }
}


