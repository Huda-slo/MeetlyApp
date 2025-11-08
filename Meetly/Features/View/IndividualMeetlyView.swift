//
//  IndividualMeetlyView.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//

import SwiftUI

struct IndividualMeetlyView: View {
    @StateObject private var presenter = IndividualMeetlyPresenter()
    @Environment(\.dismiss) private var dismiss
    // لحفظ الاختيار وفتح صفحة الحجز
    @State private var showBooking = false
    @State private var selectedMentor: Mentor? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground
                    .ignoresSafeArea()

                VStack(spacing: 0) {

                    // MARK: Header
                    HStack {
                        Button {
                            // يرجع للصفحة السابقة
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left.circle.fill")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundColor(Color(hex: "0A5CFE"))
                        }

                        Spacer()

                        Text("Individual Meetly")
                            .font(.custom("BeVietnamPro-SemiBold", size: 22))
                            .foregroundColor(.white)

                        Spacer()
                        Color.clear.frame(width: 24, height: 24) // لتوسيط العنوان
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 24)

                    // MARK: List
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 18) {
                            ForEach(presenter.mentors) { mentor in
                                IndividualMentorCardView(mentor: mentor) {
                                    // لما يضغط Book now
                                    selectedMentor = mentor
                                    showBooking = true
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 32)
                    }
                }
            }
            .onAppear {
                presenter.onAppear()
            }
            // MARK: Navigation to Booking page
            .navigationDestination(isPresented: $showBooking) {
                BookingView()
            }
        }
    }
}

#Preview {
    IndividualMeetlyView()
        .preferredColorScheme(.dark)
}
