//
//  SettingsView.swift
//  Meetly1
//
//  Created by Huda Almadi on 07/11/2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showLogin: Bool
    @Binding var userName: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Text("Settings")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Button("Logout") {
                        showLogin = true
                        userName = ""
                        dismiss()
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                    
                    Spacer()
                }
                .padding(.top, 40)
            }
            .navigationBarHidden(true)
        }
    }
}
