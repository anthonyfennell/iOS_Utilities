//
//  File.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import Foundation

extension DateFormatter {
    private static let formatterQueue: DispatchQueue = {
        return DispatchQueue(label: "queue.dateoutputformatter")
    }()
    
    public static func formatToWeekday(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.weekday.string(from: date)
        }
    }
    
    public static func formatToYear(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.year.string(from: date)
        }
    }
    
    public static func formatToMonth(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.month.string(from: date)
        }
    }
    
    public static func formatToShortMonth(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.shortMonth.string(from: date)
        }
    }
    
    // MARK: - Month Year
    public static func formatToMonthCommaYear(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.monthCommaYear.string(from: date)
        }
    }
    
    public static func formatToShortMonthYear(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.shortMonthYear.string(from: date)
        }
    }
    
    // MARK: - Month day
    public static func formatToShortMonthDay(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.shortMonthDay.string(from: date)
        }
    }
    
    public static func formatToMonthDay(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.monthDay.string(from: date)
        }
    }
    
    // MARK: - Month day year
    public static func formatToMonthDayCommaYear(_ date: Date) -> String {
        self.formatterQueue.sync {
            return DateOutputFormatter.monthDayCommaYear.string(from: date)
        }
    }
}

class DateOutputFormatter {
    fileprivate static let weekday: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    fileprivate static let year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    fileprivate static let shortMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter
    }()
    
    fileprivate static let month: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }()
    
    // MARK: - Month day
    fileprivate static let shortMonthDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter
    }()
    
    fileprivate static let monthDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }()
    
    // MARK: - Month year
    fileprivate static let shortMonthYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM y"
        return formatter
    }()
    
    fileprivate static let monthCommaYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM, y"
        return formatter
    }()
    
    // MARK: - Month day year
    fileprivate static let monthDayCommaYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, y"
        return formatter
    }()
}
