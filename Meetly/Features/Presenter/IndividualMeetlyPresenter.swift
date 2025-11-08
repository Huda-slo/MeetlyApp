//
//  IndividualMeetlyPresenter.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//

import Foundation

final class IndividualMeetlyPresenter: ObservableObject {

    // OUTPUT للـ View
    @Published private(set) var mentors: [Mentor] = []
    @Published var lastBookedMentor: Mentor? = nil  // لو حبيتي تستخدمينه لاحقاً

    // DEPENDENCY
    private let service: IndividualMeetlyService

    init(service: IndividualMeetlyService = LocalIndividualMeetlyService()) {
        self.service = service
    }

    // MARK: - Intents

    func onAppear() {
        mentors = service.fetchMentors()
    }

    func didTapBook(mentor: Mentor) {
        guard mentor.status == .available else { return }
        lastBookedMentor = mentor
        // هنا تحطين منطق الحجز لاحقاً (API / تخزين)
    }

    func didTapBack() {
        // الـ View تستدعيه، والرواتر / الـ Parent يتصرف
    }
}
