//
//  File.swift
//  LuckyPop
//
//  Created by junky on 2024/6/8.
//

import Foundation
import SnapKit

public protocol AlertPopable: Popable {}

extension AlertPopable {
    
    public func shouldShow(spView: UIView, compelete: @escaping () -> Void) {
        
        let width = min(UIScreen.main.bounds.size.width - 80, 390)
        snp.makeConstraints { make in
            make.centerY.equalTo(spView).offset(-30)
            make.centerX.equalTo(spView)
            make.width.equalTo(width)
        }
        compelete()
    }
    
}
