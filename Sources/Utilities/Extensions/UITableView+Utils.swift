//
//  UITableView+Utils.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import UIKit

extension UITableView {
    public func setFalseFooterView() {
        let view = UIView()
        view.backgroundColor = .clear
        self.tableFooterView = view
    }
}
