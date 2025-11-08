//
//  IndividualMeetlyService.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//

import Foundation

protocol IndividualMeetlyService {
    func fetchMentors() -> [Mentor]
}

/// داتا محلية مؤقتة (Mock)
struct LocalIndividualMeetlyService: IndividualMeetlyService {
    func fetchMentors() -> [Mentor] {
        [
            Mentor(name: "Shahad Alharbi", imageName: "Mentor1", status: .available),
            Mentor(name: "Amal AlOtaibi",  imageName: "Mentor2", status: .available),
            Mentor(name: "Ali Abu Halika", imageName: "Mentor3", status: .busy),
            Mentor(name: "Dana Abu Aba",   imageName: "Mentor4", status: .available)
        ]
    }
}
