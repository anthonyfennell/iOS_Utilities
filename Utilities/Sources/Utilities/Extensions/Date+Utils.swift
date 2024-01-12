//
//  File.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import Foundation

extension Date {
    init(year: Int, month: Int, day: Int) {
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.year = year
        dateComponent.month = month
        dateComponent.day = day
        self.init(timeInterval:0, since:calendar.date(from: dateComponent)!)
    }
    
    fileprivate var calender: Calendar {
        return Calendar.current
    }
    
    // MARK: - Component Values
    func day() -> Int {
        return self.calender.component(.day, from: self)
    }
    
    func weekDay() -> Int {
        return self.calender.component(.weekday, from: self)
    }
    
    func month() -> Int {
        return self.calender.component(.month, from: self)
    }
    
    func year() -> Int {
        return self.calender.component(.year, from: self)
    }
    
    func daysInMonth() -> Int {
        let range = self.calender.range(of: .day, in: .month, for: self)
        return (range?.count)!
    }
    
    func daysUntilEndOfMonth(_ today: Date) -> Int {
        let endOfCurrentMonth = today.asEndOfMonth()
        let days = self.daysUntil(endOfCurrentMonth)
        guard days > 0 else {
            return 0
        }
        return days
    }
    
    func daysUntil(_ endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: endDate)
        return components.day!
    }
    
    static func monthsBetween(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: startDate, to: endDate)
        return components.month!
    }
    
    static func weeksBetween(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        let weeks = Int(components.day! / 7)
        return weeks
    }
    
    // MARK: - Mutate
    mutating func add(years: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = years
        self = self.calender.date(byAdding: dateComponents, to: self)!
    }
    
    mutating func add(months: Int) {
        self = self.calender.date(byAdding: .month, value: months, to: self)!
    }
    
    mutating func add(days: Int) {
        self = self.calender.date(byAdding: .day, value: days, to: self)!
    }
    
    mutating func add(weeks: Int) {
        self = self.calender.date(byAdding: .day, value: weeks * 7, to: self)!
    }
    
    // MARK: - Creation
    func dateAdding(months: Int) -> Date {
        return self.adding(months: months)
    }
    
    func dateAdding(days: Int) -> Date {
        var componenets = DateComponents()
        componenets.day = days
        return self.calender.date(byAdding: componenets, to: self)!
    }
    
    func dateAsFirstOfMonth() -> Date {
        var components = self.calender.dateComponents([.year, .month], from: self)
        components.day = 1
        return self.calender.date(from: components)!
    }
    
    func dateAsLastOfMonth() -> Date {
        let lastDay = self.daysInMonth()
        return Date(year: self.year(), month: self.month(), day: lastDay)
    }
    
    func dateAsNextMonthDayOne() -> Date {
        return createNextMonth()
    }
    
    func dateAsFirstDayOfYear() -> Date {
        return Date(year: self.year(), month: 1, day: 1)
    }
    
    func dateAsLastDayOfYear() -> Date {
        return Date(year: self.year(), month: 12, day: 31)
    }
    
    func asEndOfMonth() -> Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month], from: self)
        
        let daysRange = calendar.range(of: .day, in: .month, for: self)
        components.day = daysRange?.count
        components.hour = 23
        components.minute = 59
        components.second = 59
        
        return calendar.date(from: components)!
    }
    
    func atMidnight() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: self)
        return calendar.date(from: components)!
    }
    
    func atEndOfDay() -> Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.day, .month, .year], from: self)
        components.hour = 23
        components.minute = 59
        components.second = 59
        return calendar.date(from: components)!
    }
    
    // MARK: - Evaluations
    func isWeekend() -> Bool {
        let weekday = self.calender.component(.weekday, from: self)
        return (weekday == 1 || weekday == 7)
    }
    
    // Day
    func isSameDayOrBefore(date: Date) -> Bool {
        return self < date || isSameDayAs(date: date)
    }
    
    func isSameDayOrAfter(date: Date) -> Bool {
        return self > date || isSameDayAs(date: date)
    }
    
    func isSameDayAs(date: Date) -> Bool {
        return (self.day() == date.day()) && (self.month() == date.month() && (self.year() == date.year()))
    }
    
    func isBeforeThis(day: Date) -> Bool {
        return self < day && !self.isSameDayAs(date: day)
    }
    
    // Month
    func isSameMonthAs(date: Date) -> Bool {
        return (self.month() == date.month() && self.year() == date.year())
    }
    
    // Year
    func isSameYearAs(date: Date) -> Bool {
        return self.year() == date.year()
    }
    
    // MARK: - Helper
    fileprivate func adding(months: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = months
        return self.calender.date(byAdding: dateComponents, to: self)!
    }
    
    fileprivate func adding(days: Int) -> Date {
        var componenets = DateComponents()
        componenets.day = days
        return self.calender.date(byAdding: componenets, to: self)!
    }
    
    fileprivate func createNextMonth() -> Date {
        guard let date = self.calender.date(byAdding: .month, value: 1, to: self) else {
            return Date()
        }
        
        var components = self.calender.dateComponents([.month, .year], from: date)
        components.day = 1
        return self.calender.date(from: components)!
    }
}
