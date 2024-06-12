//
//  File.swift
//  LuckyPop
//
//  Created by junky on 2024/6/8.
//

import Foundation
import SnapKit

public protocol AlertPopable: Popable {
    var hLayout: Layout { get }
    
    var vLayout: Layout { get }
}

public extension AlertPopable {
    
    var hLayout: Layout {
        return .margin(-80)
    }
    
    var vLayout: Layout {
        return .fit
    }
    
    
    func showAnimation(spView: UIView) {
        
        snp.makeConstraints { make in
            
            switch hLayout {
            case .fix(let cGFloat):
                make.width.equalTo(cGFloat)
            case .margin(let cGFloat):
                make.width.equalTo(spView).offset(cGFloat)
            case .fit:
                break
            }
            
            switch vLayout {
            case .fix(let cGFloat):
                make.height.equalTo(cGFloat)
            case .margin(let cGFloat):
                make.height.equalTo(spView).offset(cGFloat)
            case .fit:
                break
            }
            make.center.equalTo(spView)
        }
    }
    
    func hideAnimation(spView: UIView, compelete: @escaping () -> Void) {
        compelete()
    }
}
