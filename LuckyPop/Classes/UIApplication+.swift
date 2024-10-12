//
//  SafeArea+.swift
//  LuckyPop
//
//  Created by junky on 2024/5/27.
//

import Foundation

extension UIApplication {
    
    public var currentWindow: UIWindow? {
        guard let delegate = UIApplication.shared.delegate,
              let window = delegate.window,
              let window = window
        else { return nil }
        return window
    }
    
    public var safeAreaInset: UIEdgeInsets {
        guard let window = currentWindow else { return .zero }
        return window.safeAreaInsets
    }
    
}

