//
//  HomeViewModel.swift
//  Meetly
//
//  Created by Huda Almadi on 03/11/2025.
//
import Foundation

class HomeViewModel: ObservableObject {
    @Published var user: User
    @Published var sessions: [Session]
    @Published var services: [Service]
    
    init() {
        self.user = User(greeting: "", name: "")
        self.sessions = [
            Session(title: "Business model", time: "11:00–11:30 AM", imageName: "session"),
            Session(title: "Data strategy", time: "12:00–12:30 PM", imageName: "session"),
            Session(title: "Marketing plan", time: "1:00–1:30 PM", imageName: "session")
        ]
        self.services = [
            Service(title: " individual meetly", subtitle: "30 Minutes", colorName: "Blue"),
            Service(title: "Create event", subtitle: "Open", colorName: "Gray")
        ]
    }
    
    func setUser(name: String) {
        self.user = User(greeting: "Good Morning,", name: name)
    }
    
    func addSession(title: String, time: String, imageName: String = "session") {
        let newSession = Session(title: title, time: time, imageName: imageName)
        sessions.append(newSession)
    }
}
