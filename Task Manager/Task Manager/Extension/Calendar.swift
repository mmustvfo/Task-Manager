//
//  Calendar.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import SwiftUI

extension Calendar {
    
    var hours: [Date] {
        let startOfDay = self.startOfDay(for: Date())
        var hours: [Date] = []
        for hourIndex in 0..<24 {
            if let hour = self.date(byAdding: .hour, value: hourIndex, to: startOfDay) {
                hours.append(hour)
            }
        }
        return hours
    }
    
    var currentWeek: [WeekDay] {
        guard let firstWeekDay = self.dateInterval(of: .weekOfMonth, for: Date())?.start else {
            return []
        }
        var week: [WeekDay] = []
        for i in 0...6 {
            if let day = Calendar.current.date(byAdding: .day, value: i, to: firstWeekDay) {
                let dayWeekSymbol: String = day.toString("EEEE")
                let isToday = self.isDateInToday(day)
                week.append(WeekDay(string: dayWeekSymbol, date: day,isToday: isToday))
            }
        }
        return week
    }
    
    struct WeekDay: Identifiable {
        let id = UUID()
        var string: String
        var date: Date
        var isToday: Bool = false
    }
    
}
