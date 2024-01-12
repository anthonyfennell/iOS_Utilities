//
//  Int+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import Foundation

extension Int {
    func format(with formatter: NumberFormatter) -> String {
        guard let score = formatter.string(from: NSNumber(value: self)) else {
            return "\(self)"
        }
        return score
    }
    
    func ordinal() -> String {
        if self >= 10 {
            let number = self / 10
            let tensDigit = number % 10
            
            if tensDigit == 1 {
                return "th"
            }
        }
        
        let onesDigit = self % 10
        if onesDigit == 0 || onesDigit >= 4 {
            return "th"
        } else if onesDigit == 1 {
            return "st"
        } else if onesDigit == 2 {
            return "nd"
        } else {
            return "rd"
        }
    }
}
