//
//  AddSessionView.swift
//  Meetly1
//
//  Created by Huda Almadi on 07/11/2025.
//

import SwiftUI

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
