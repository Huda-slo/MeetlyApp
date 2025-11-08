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
    
    @State private var userField = "iOS Developer"
    @State private var userInterest = "UX/UI"
    
    var body: some View {
        NavigationView {
            ZStack {
                // خلفية سوداء
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    // MARK: - Header
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.blue)
                        }
                        
                        Spacer()
                        
                        Text("Setting")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            print("Saved!")
                        }) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 15)
                    
                    // MARK: - Profile Image
                    Image("female pic1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.blue, lineWidth: 3)
                        )
                        .padding(.top, 20)
                    
                    // MARK: - Form Container
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Group {
                            Text("your Name")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("", text: $userName)
                                .padding()
                                .background(Color.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.blue, lineWidth: 1.5)
                                )
                                .foregroundColor(.white)
                        }
                        
                        Group {
                            Text("your Field")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("", text: $userField)
                                .padding()
                                .background(Color.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1.2)
                                )
                                .foregroundColor(.blue)
                        }
                        
                        Group {
                            Text("Interest")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("", text: $userInterest)
                                .padding()
                                .background(Color.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1.2)
                                )
                                .foregroundColor(.blue)
                        }
                        
                    }
                    .padding(25)
                    .background(Color(red: 22/255, green: 22/255, blue: 22/255))
                    .cornerRadius(20)
                    .padding(.horizontal, 25)
                    
                    Spacer()
                    
                    // MARK: - Logout Button
                    Button(action: {
                        showLogin = true
                        userName = ""
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.uturn.left.circle")
                                .font(.system(size: 18))
                                .foregroundColor(.red)
                            Text("Log out")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.red)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(red: 22/255, green: 22/255, blue: 22/255))
                        .cornerRadius(14)
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 30)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SettingsView(showLogin: .constant(false), userName: .constant("Sara"))
}
