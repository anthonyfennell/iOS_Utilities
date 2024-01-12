//
//  KeyboardObserver.swift
//  
//
//  Created by Anthony Fennell on 1/11/24.
//

import Foundation
import UIKit

public final class KeyboardObserver {
    private weak var scrollView: UIScrollView?
    
    public init(scrollView: UIScrollView) {
        self.scrollView = scrollView
        self.observeKeyboardChanges()
    }
    
    private func observeKeyboardChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillBeShown(_ notif: Notification) {
        if let keyboardRect = notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardRect.size.height, right: 0)
            self.scrollView?.contentInset = insets
            self.scrollView?.scrollIndicatorInsets = insets
        }
    }
    
    @objc func keyboardWillBeHidden(_ notif: Notification) {
        self.scrollView?.contentInset = .zero
        self.scrollView?.scrollIndicatorInsets = .zero
    }
}
