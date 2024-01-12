//
//  String+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import Foundation

extension String {
    public func areMatchesInStringWithPattern(_ pattern : String) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        if let _ = matches.first {
            return true
        }
        return false
    }
}
