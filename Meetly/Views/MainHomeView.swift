//
//  MainHomeView.swift
//  Meetly
//
//  Created by Huda Almadi on 04/11/2025.
//

import SwiftUI

struct MainHomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var showSettings: Bool
    @Binding var showNotifications: Bool
    @Binding var showAddSession: Bool
    @Binding var showLogin: Bool
    @Binding var userName: String

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 30) {
                        // Header
                        HStack(alignment: .top) {
                            Button(action: { showNotifications = true }) {
                                Image(systemName: "bell.fill")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                            VStack(alignment: .trailing, spacing: 6) {
                                Button(action: { showSettings = true }) {
                                    Image(systemName: "gearshape.fill")
                                        .font(.title2)
                                        .foregroundColor(.blue)
                                }
                                VStack(alignment: .trailing, spacing: 2) {
                                    Text(viewModel.user.greeting)
                                        .foregroundColor(.white)
                                        .font(.title3)
                                    Text(viewModel.user.name)
                                        .foregroundColor(.blue)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Today's Session
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
                        
                        // Other Services
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
