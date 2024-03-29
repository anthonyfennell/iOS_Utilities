//
//  Thread+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import Foundation

public func mainThread(using closure: @escaping () -> ()) {
    DispatchQueue.main.async(execute: closure)
}
