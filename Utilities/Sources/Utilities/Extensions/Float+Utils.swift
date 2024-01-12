//
//  File.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import Foundation

extension BinaryFloatingPoint {
    public func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        let divisor = Self((0..<places).reduce(1.0) { (accum, _) in 10.0 * accum })
        return (self * divisor).rounded() / divisor
    }
}
