//
//  LoginView.swift
//  Meetly1
//
//  Created by Huda Almadi on 07/11/2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var userName: String
    @Binding var showLogin: Bool
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Meetly")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                VStack(spacing: 20) {
                    TextField("Enter your name", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 40)
                        .foregroundColor(.black)
                        .background(Color.white)
                    
                    Button("Login") {
                        if !userName.isEmpty {
                            viewModel.setUser(name: userName)
                            showLogin = false
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}
