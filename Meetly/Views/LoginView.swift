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
    
    @State private var field: String = ""
    @State private var interest: String = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 35) {
                // MARK: - Profile Image
                Image("female pic1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .padding(.top, 40)
                
                // MARK: - Input Fields
                VStack(alignment: .leading, spacing: 25) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Enter your Name")
                            .font(.headline)
                            .foregroundColor(.white)
                        TextField("Name", text: $userName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: 1))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Enter your Feild")
                            .font(.headline)
                            .foregroundColor(.white)
                        TextField("Feild", text: $field)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Enter your Interest")
                            .font(.headline)
                            .foregroundColor(.white)
                        TextField("Interest", text: $interest)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                
                // MARK: - Save Button
                Button(action: {
                    if !userName.isEmpty {
                        viewModel.setUser(name: userName)
                        showLogin = false
                    }
                }) {
                    Text("Save")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                        .padding(.horizontal)
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView(viewModel: HomeViewModel(), userName: .constant("Sara"), showLogin: .constant(true))
}
