//
//  Booking.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//
import SwiftUI

struct BookingView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var presenter = BookingPresenter()

    @State private var showConfirmation = false

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 18) {
                header

                ScrollView(showsIndicators: false) {
                    content
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            .padding(.top, -10)

            if showConfirmation {
                confirmationPopup
            }
        }
        .onAppear {
            presenter.onAppear()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Sections

private extension BookingView {

    // HEADER
    var header: some View {
        HStack {
            BackButton {
                dismiss()
            }

            Spacer()

            Text("Book Individual Meetly")
                .font(.custom("BeVietnamPro-SemiBold", size: 22))
                .foregroundColor(.white)

            Spacer()
            Color.clear.frame(width: 24, height: 24)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 24)
    }

    // MAIN CONTENT
    var content: some View {
        VStack(alignment: .leading, spacing: 26) {
            Spacer().frame(height: 20)

            dateSection
            timeSection
            locationSection
            bookButton
        }
    }

    // DATE (أسبوعين)
    var dateSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "calendar")
                    .renderingMode(.template)
                    .foregroundColor(Color(hex: "0A5CFE"))
                    .font(.system(size: 16))

                Text("Date")
                    .font(.custom("BeVietnamPro-SemiBold", size: 16))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 8)

            let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 7)

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(presenter.next14Days, id: \.self) { date in
                    VStack(spacing: 4) {
                        Text(presenter.dayShortName(date))
                            .font(.custom("BeVietnamPro-Regular", size: 10))
                            .foregroundColor(.white.opacity(0.6))

                        Text(presenter.dayNumber(date))
                            .font(.custom("BeVietnamPro-SemiBold", size: 14))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .padding(.vertical, 6)
                    .background(
                        Calendar.current.isDate(presenter.selectedDate, inSameDayAs: date)
                        ? Color(hex: "294899")
                        : Color.appCard
                    )
                    .cornerRadius(10)
                    .onTapGesture {
                        presenter.selectedDate = date
                    }
                }
            }
            .padding(.bottom, 16)
        }
    }

    // TIME
    var timeSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image("TimeIcon")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(hex: "0A5CFE"))
                    .frame(width: 18, height: 18)

                Text("Time")
                    .font(.custom("BeVietnamPro-SemiBold", size: 16))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 6)

            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 150), spacing: 14)],
                spacing: 14
            ) {
                ForEach(presenter.times) { time in
                    Text(time.time)
                        .font(.custom("BeVietnamPro-Regular", size: 14))
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(
                            presenter.selectedTime?.id == time.id
                            ? Color(hex: "294899")
                            : Color.appCard
                        )
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .onTapGesture {
                            presenter.selectTime(time)
                        }
                }
            }
        }
    }

    // LOCATION
    var locationSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image("LocationIcon")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(hex: "0A5CFE"))
                    .frame(width: 18, height: 18)

                Text("Meetly location")
                    .font(.custom("BeVietnamPro-SemiBold", size: 16))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 6)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(presenter.rooms) { room in
                        Text(room.name)
                            .font(.custom("BeVietnamPro-Regular", size: 14))
                            .padding(.horizontal, 18)
                            .padding(.vertical, 8)
                            .background(
                                presenter.selectedRoom?.id == room.id
                                ? Color(hex: "294899")
                                : Color.appCard
                            )
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .onTapGesture {
                                presenter.selectRoom(room)
                            }
                    }
                }
            }
        }
    }

    // BOOK BUTTON
    var bookButton: some View {
        Button {
            if presenter.selectedTime != nil && presenter.selectedRoom != nil {
                showConfirmation = true
            }
        } label: {
            Text("Book now")
                .font(.custom("BeVietnamPro-SemiBold", size: 16))
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(
                    presenter.selectedTime != nil && presenter.selectedRoom != nil
                    ? Color(hex: "0A5CFE")
                    : Color.gray.opacity(0.5)
                )
                .foregroundColor(.white)
                .cornerRadius(14)
        }
        .padding(.top, 10)
        .disabled(presenter.selectedTime == nil || presenter.selectedRoom == nil)
        .animation(.easeInOut(duration: 0.3), value: presenter.selectedTime)
        .animation(.easeInOut(duration: 0.3), value: presenter.selectedRoom)
    }

    // POPUP
    var confirmationPopup: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                ZStack {
                    Circle()
                        .fill(Color(hex: "0A5CFE"))
                        .frame(width: 140, height: 140)
                        .shadow(color: Color(hex: "0A5CFE").opacity(0.6),
                                radius: 25, x: 0, y: 12)

                    Image(systemName: "checkmark")
                        .font(.system(size: 56, weight: .bold))
                        .foregroundColor(.white)
                }

                VStack(spacing: 4) {
                    Text("Meeting")
                    Text("Confirmed")
                }
                .font(.custom("BeVietnamPro-SemiBold", size: 22))
                .foregroundColor(.white)

                Button {
                    showConfirmation = false
                } label: {
                    Text("Cancel")
                        .font(.custom("BeVietnamPro-SemiBold", size: 16))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color(hex: "C74343"))
                        .foregroundColor(.white)
                        .cornerRadius(24)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 8)
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 24)
            .background(Color.appCard)
            .cornerRadius(32)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    BookingView()
        .preferredColorScheme(.dark)
}
