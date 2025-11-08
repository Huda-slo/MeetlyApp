//
//  Mentor.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//

import Foundation

enum MentorStatus {
    case available
    case busy
}

struct Mentor: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let status: MentorStatus
}
