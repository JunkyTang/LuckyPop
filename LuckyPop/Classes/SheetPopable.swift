//
//  PopAbleSheet.swift
//  LuckyPop
//
//  Created by junky on 2024/6/8.
//

import Foundation
import SnapKit


public protocol SheetPopable: Popable {
    
    var animationIntervel: TimeInterval { get }
}

extension SheetPopable {
    
    public var animationIntervel: TimeInterval { return 0.2 }
    
    public func shouldShow(spView: UIView, compelete: @escaping () -> Void) {
        snp.makeConstraints { make in
            make.top.equalTo(spView.snp.bottom)
            make.width.equalTo(spView)
        }
        
        spView.layoutIfNeeded()
        
        let height = bounds.size.height
        UIView.animate(withDuration: animationIntervel) {
            self.transform = CGAffineTransformMakeTranslation(0, -height)
        } completion: { _ in
            compelete()
        }

    }
    
    public func shouldHide(spView: UIView, compelete: @escaping () -> Void) {
        
        UIView.animate(withDuration: animationIntervel) {
            self.transform = .identity
        } completion: { _ in
            compelete()
        }

    }
    
    
}


public protocol FixedHeightSheetPopable: SheetPopable {
    
    var fixedHeight: CGFloat { get }
}

extension FixedHeightSheetPopable {
    
    public func shouldShow(spView: UIView, compelete: @escaping () -> Void) {
        snp.makeConstraints { make in
            make.top.equalTo(spView.snp.bottom)
            make.width.equalTo(spView)
            make.height.equalTo(fixedHeight)
        }
        
        spView.layoutIfNeeded()
        
        let height = bounds.size.height
        UIView.animate(withDuration: animationIntervel) {
            self.transform = CGAffineTransformMakeTranslation(0, -height)
        } completion: { _ in
            compelete()
        }

    }
}


