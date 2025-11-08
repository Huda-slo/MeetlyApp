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
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 35) {
                // MARK: - Header
                Text("Create Event")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                // MARK: - Input Fields
                VStack(alignment: .leading, spacing: 25) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Event Title")
                            .font(.headline)
                            .foregroundColor(.white)
                        TextField("Enter event title", text: $title)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: 1))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Select Date")
                            .font(.headline)
                            .foregroundColor(.white)
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(CompactDatePickerStyle())
                            .colorScheme(.dark)
                            .accentColor(.blue)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Select Time")
                            .font(.headline)
                            .foregroundColor(.white)
                        DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(CompactDatePickerStyle())
                            .colorScheme(.dark)
                            .accentColor(.blue)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                
                // MARK: - Action Buttons
                VStack(spacing: 15) {
                    Button("Book Now") {
                        guard !title.isEmpty else { return }
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateStyle = .medium
                        dateFormatter.timeStyle = .short
                        let dateTimeString = dateFormatter.string(from: combineDateAndTime(date: selectedDate, time: selectedTime))
                        
                        viewModel.addSession(title: title, time: dateTimeString)
                        isPresented = false
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    Button("Cancel") {
                        isPresented = false
                    }
                    .font(.body)
                    .foregroundColor(.gray)
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
    }
    
    private func combineDateAndTime(date: Date, time: Date) -> Date {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let timeComponents = calendar.dateComponents([.hour, .minute], from: time)
        
        var combinedComponents = DateComponents()
        combinedComponents.year = dateComponents.year
        combinedComponents.month = dateComponents.month
        combinedComponents.day = dateComponents.day
        combinedComponents.hour = timeComponents.hour
        combinedComponents.minute = timeComponents.minute
        
        return calendar.date(from: combinedComponents) ?? date
    }
}

#Preview {
    AddSessionView(isPresented: .constant(true), viewModel: HomeViewModel())
}
