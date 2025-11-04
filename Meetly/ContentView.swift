//
//  ContentView.swift
//  Meetly
//
//  Created by Huda Almadi on 23/10/2025.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var userName: String = ""
    @State private var showLogin = true
    @State private var showSettings = false
    @State private var showNotifications = false
    @State private var showAddSession = false
    
    // متغيرات لإضافة جلسة جديدة
    @State private var newTitle = ""
    @State private var newTime = ""

    var body: some View {
        if showLogin {
            // Login Screen
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
        } else {
            // Main App Screen
            NavigationView {
                ZStack {
                    Color.black.ignoresSafeArea()
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 30) {
                            
                            // MARK: - Header
                            HStack(alignment: .top) {
                                Button(action: {
                                    showNotifications = true
                                }) {
                                    Image(systemName: "bell.fill")
                                        .font(.title2)
                                        .foregroundColor(.blue)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 6) {
                                    Button(action: {
                                        showSettings = true
                                    }) {
                                        Image(systemName: "gearshape.fill")
                                            .font(.title2)
                                            .foregroundColor(.blue)
                                    }
                                    
                                    VStack(alignment: .trailing, spacing: 2) {
                                        Text(viewModel.user.greeting)
                                            .foregroundColor(.white)
                                            .font(.title3)
                                            .fontWeight(.medium)
                                        Text(viewModel.user.name)
                                            .foregroundColor(.blue)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            
                            // MARK: - Today's Session
                            VStack(alignment: .leading, spacing: 15) {
                                Text("Today's Session")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(viewModel.sessions) { session in
                                            SessionCardView(session: session)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            
                            // MARK: - Other Services
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Other Services")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                                
                                HStack(spacing: 16) {
                                    ForEach(viewModel.services) { service in
                                        Button(action: {
                                            if service.title == "Create event" {
                                                showAddSession = true
                                            }
                                        }) {
                                            ServiceButtonView(service: service)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                            Spacer(minLength: 40)
                        }
                        .padding(.top, 40)
                    }
                }
                .navigationBarHidden(true)
                .sheet(isPresented: $showSettings) {
                    SettingsView(showLogin: $showLogin, userName: $userName)
                }
                .sheet(isPresented: $showNotifications) {
                    NotificationsView()
                }
                .sheet(isPresented: $showAddSession) {
                    AddSessionView(isPresented: $showAddSession, viewModel: viewModel)
                }
            }
        }
    }
}

// MARK: - Session Card View
struct SessionCardView: View {
    let session: Session
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(session.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(session.time)
                .font(.footnote)
                .padding(.vertical, 6)
                .padding(.horizontal, 10)
                .background(Color.blue)
                .cornerRadius(6)
                .foregroundColor(.white)
            Spacer()
            Image("Session")
                .resizable()
                .scaledToFill()
                .frame(height: 220)
                .clipped()
                .cornerRadius(20)
        }
        .padding()
        .frame(width: 260, height: 340)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(30)
    }
}

// MARK: - Service Button View
struct ServiceButtonView: View {
    let service: Service
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            Text(service.title)
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(service.colorName == "Blue" ? .blue : .white)
            Text(service.subtitle)
                .font(.caption2)
                .foregroundColor(.white.opacity(0.8))
        }
        .frame(width: 110, height: 70)
        .background(service.colorName == "Blue" ? Color.blue.opacity(0.15) : Color.gray)
        .cornerRadius(18)
    }
}

// MARK: - Add Session View
struct AddSessionView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: HomeViewModel
    @State private var title = ""
    @State private var time = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 25) {
                Text("Create New Session")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                TextField("Session Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Time (e.g. 2:00–2:30 PM)", text: $time)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button("Add Session") {
                    guard !title.isEmpty && !time.isEmpty else { return }
                    viewModel.addSession(title: title, time: time)
                    isPresented = false
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Button("Cancel") {
                    isPresented = false
                }
                .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(.top, 40)
        }
    }
}

// MARK: - Notifications View
// MARK: - Settings View
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
// MARK: - Notifications View
struct NotificationsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Notifications")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("You have no new notifications.")
                    .foregroundColor(.gray)
                
                Button("Close") {
                    dismiss()
                }
                .foregroundColor(.blue)
                .padding(.top, 20)
            }
        }
    }
}

           
#Preview {
    ContentView()
}










































//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = HomeViewModel()
//    @State private var userName: String = ""
//    @State private var showLogin = true
//    @State private var showSettings = false
//    
//    var body: some View {
//        if showLogin {
//            // Login/User Selection Screen
//            ZStack {
//                Color.black.ignoresSafeArea()
//                
//                VStack(spacing: 30) {
//                    Text("Meetly")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.blue)
//                    
//                    VStack(spacing: 20) {
//                        TextField("Enter your name", text: $userName)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding(.horizontal, 40)
//                            .foregroundColor(.black)
//                            .background(Color.white)
//                        
//                        Button("Login") {
//                            if !userName.isEmpty {
//                                viewModel.setUser(name: userName)
//                                showLogin = false
//                            }
//                        }
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        
//                        Button("View as Example User (Sara)") {
//                            viewModel.showExampleUser()
//                            showLogin = false
//                        }
//                        .foregroundColor(.gray)
//                    }
//                }
//            }
//        } else {
//            // Main App Screen with Card Design
//            NavigationView {
//                ZStack {
//                    Color.black.ignoresSafeArea()
//                    
//                    ScrollView(showsIndicators: false) {
//                        VStack(alignment: .leading, spacing: 30) {
//                            
//                            // Header with user greeting and settings button
//                            HStack {
//                                Spacer()
//                                VStack(alignment: .trailing) {
//                                    Text(viewModel.user.greeting)
//                                        .foregroundColor(.white)
//                                        .font(.body)
//                                    Text(viewModel.user.name)
//                                        .foregroundColor(.blue)
//                                        .font(.title3)
//                                        .fontWeight(.semibold)
//                                }
//                                
//                                Spacer()
//                                
//                                // Settings button
//                                Button(action: {
//                                    showSettings = true
//                                }) {
//                                    Image(systemName: "gearshape.fill")
//                                        .foregroundColor(.blue)
//                                        .font(.title2)
//                                }
//                            }
//                            .padding(.horizontal)
//                            
//                            // Today's Session with Horizontal Cards
//                            VStack(alignment: .leading, spacing: 15) {
//                                Text("Today's Session")
//                                    .font(.title3)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.blue)
//                                    .padding(.horizontal)
//                                
//                                // Scroll of session cards
//                                ScrollView(.horizontal, showsIndicators: false) {
//                                    HStack(spacing: 20) {
//                                        ForEach(viewModel.sessions) { session in
//                                            SessionCardView(session: session)
//                                        }
//                                    }
//                                    .padding(.horizontal)
//                                }
//                            }
//                            
//                            // Other Services with Buttons
//                            VStack(alignment: .leading, spacing: 20) {
//                                Text("Other Services")
//                                    .font(.title3)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.blue)
//                                    .padding(.horizontal)
//                                
//                                HStack(spacing: 16) {
//                                    ForEach(viewModel.services) { service in
//                                        ServiceButtonView(service: service)
//                                    }
//                                }
//                                .padding(.horizontal)
//                            }
//                            
//                            Spacer(minLength: 40)
//                        }
//                        .padding(.top, 40)
//                    }
//                }
//                .navigationBarHidden(true)
//                .sheet(isPresented: $showSettings) {
//                    SettingsView(showLogin: $showLogin, userName: $userName)
//                }
//            }
//        }
//    }
//}
//
//// MARK: - Session Card View
//struct SessionCardView: View {
//    let session: Session
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text(session.title)
//                .font(.title3)
//                .fontWeight(.semibold)
//                .foregroundColor(.white)
//            
//            Text(session.time)
//                .font(.footnote)
//                .padding(.vertical, 6)
//                .padding(.horizontal, 10)
//                .background(Color.blue)
//                .cornerRadius(6)
//                .foregroundColor(.white)
//            
//            Spacer()
//            
//            // Session image placeholder
//            Image(systemName: "calendar.circle.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 120)
//                .foregroundColor(.blue)
//                .padding()
//        }
//        .padding()
//        .frame(width: 260, height: 340)
//        .background(Color.gray.opacity(0.2))
//        .cornerRadius(30)
//    }
//}
//
//// MARK: - Service Button View
//struct ServiceButtonView: View {
//    let service: Service
//    
//    var body: some View {
//        VStack(alignment: .center, spacing: 6) {
//            Text(service.title)
//                .font(.footnote)
//                .fontWeight(.medium)
//                .foregroundColor(.white)
//            Text(service.subtitle)
//                .font(.caption2)
//                .foregroundColor(.white.opacity(0.8))
//        }
//        .frame(width: 110, height: 70)
//        .background(service.colorName == "Blue" ? Color.blue : Color.gray)
//        .cornerRadius(18)
//    }
//}
//
//// Settings View (appears when gear icon is tapped)
//struct SettingsView: View {
//    @Binding var showLogin: Bool
//    @Binding var userName: String
//    @Environment(\.dismiss) private var dismiss
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.black.ignoresSafeArea()
//                
//                VStack(spacing: 30) {
//                    Text("Settings")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                    
//                    Button("Logout") {
//                        showLogin = true
//                        userName = ""
//                        dismiss()
//                    }
//                    .padding()
//                    .background(Color.red)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                    
//                    Button("Cancel") {
//                        dismiss()
//                    }
//                    .foregroundColor(.blue)
//                    
//                    Spacer()
//                }
//                .padding(.top, 40)
//            }
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
