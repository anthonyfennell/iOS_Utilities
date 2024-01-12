//
//  DateOutputFormatterTests.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import XCTest
@testable import Utilities

class DateOutputFormatterTests: XCTestCase {
    
    private var march1_2020: Date! = Date(year: 2020, month: 3, day: 1)

    override func tearDown() {
        self.march1_2020 = nil
    }

    func testWeekday() {
        // given
        let result = "Sunday"
        // then
        XCTAssertEqual(DateFormatter.formatToWeekday(self.march1_2020), result)
    }
    
    func testYear() {
        // given
        let result = "2020"
        // then
        XCTAssertEqual(DateFormatter.formatToYear(self.march1_2020), result)
    }
    
    func testMonth() {
        // given
        let result = "March"
        // then
        XCTAssertEqual(DateFormatter.formatToMonth(self.march1_2020), result)
    }
    
    func testShortMonth() {
        // given
        let result = "Mar"
        // then
        XCTAssertEqual(DateFormatter.formatToShortMonth(self.march1_2020), result)
    }
    
    // MARK: - Month day
    func testShortMonthDay() {
        // given
        let result = "Mar 01"
        // then
        XCTAssertEqual(DateFormatter.formatToShortMonthDay(self.march1_2020), result)
    }
    
    func testMonthDay() {
        // given
        let result = "Mar"
        // then
        XCTAssertEqual(DateFormatter.formatToShortMonth(self.march1_2020), result)
    }
}
