//
//  Models.swift
//  Meetly
//
//  Created by Huda Almadi on 04/11/2025.
//

import Foundation

struct User {
    let greeting: String
    let name: String
}

struct Session: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let imageName: String
}

struct Service: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let colorName: String
}
