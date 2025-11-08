//
//  Booking.swift
//  1
//
//  Created by Azhar on 08/11/2025.
//

import Foundation

protocol BookingService {
    func getAvailableTimes() -> [BookingTime]
    func getMeetingRooms() -> [MeetingRoom]
}

struct LocalBookingService: BookingService {
    func getAvailableTimes() -> [BookingTime] {
        [
            BookingTime(time: "9:50 AM"),
            BookingTime(time: "10:50 AM"),
            BookingTime(time: "11:50 AM"),
            BookingTime(time: "12:50 AM"),
            BookingTime(time: "1:50 AM"),
            BookingTime(time: "2:50 AM")
        ]
    }

    func getMeetingRooms() -> [MeetingRoom] {
        [
            MeetingRoom(name: "Neom"),
            
        ]
    }
}
