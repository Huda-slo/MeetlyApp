//
//  Booking.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//
import Foundation
import Combine

// MARK: - Models

struct BookingTime: Identifiable, Equatable {
    let id = UUID()
    let time: String
}

struct BookingRoom: Identifiable, Equatable {
    let id = UUID()
    let name: String
}

// MARK: - Presenter

class BookingPresenter: ObservableObject {

    // اختيار المستخدم
    @Published var selectedDate: Date = Date()
    @Published var selectedTime: BookingTime? = nil
    @Published var selectedRoom: BookingRoom? = nil

    // الأوقات المتاحة
    @Published private(set) var times: [BookingTime] = [
        BookingTime(time: "9:00 AM"),
        BookingTime(time: "9:30 AM"),
        BookingTime(time: "10:00 AM"),
        BookingTime(time: "10:30 AM"),
        BookingTime(time: "11:00 AM"),
        BookingTime(time: "11:30 AM")
    ]

    // الغرف المتاحة
    @Published private(set) var rooms: [BookingRoom] = [
        BookingRoom(name: "Neom"),
        
    ]

    // MARK: - Two weeks dates for custom calendar

    var next14Days: [Date] {
        let calendar = Calendar.current
        let today = Date()
        return (0..<14).compactMap { offset in
            calendar.date(byAdding: .day, value: offset, to: today)
        }
    }

    func dayNumber(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d" // 1, 2, 3 ...
        return formatter.string(from: date)
    }

    func dayShortName(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE" // SUN, MON, TUE ...
        return formatter.string(from: date)
    }

    // MARK: - Actions

    func selectTime(_ time: BookingTime) {
        selectedTime = time
    }

    func selectRoom(_ room: BookingRoom) {
        selectedRoom = room
    }

    func onAppear() {
        // لو تبين من بعدين تضيفي لوجيك هنا
    }
}
