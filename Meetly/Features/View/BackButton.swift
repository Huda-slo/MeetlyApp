//
//  BackButton.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//

import SwiftUI

struct BackButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left.circle.fill")
                .foregroundColor(Color(hex: "0A5CFE")) 
                .font(.system(size: 24, weight: .semibold))
                .shadow(color: Color(hex: "0A5CFE").opacity(0.3), radius: 4, x: 0, y: 2)
        }
    }
}
