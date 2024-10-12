//
//  PopAbleSheet.swift
//  LuckyPop
//
//  Created by junky on 2024/6/8.
//

import Foundation
import SnapKit


public protocol SheetPopable: Popable {}

extension SheetPopable {
    

    public func shouldShow(spView: UIView, compelete: @escaping () -> Void) {
        snp.makeConstraints { make in
            make.top.equalTo(spView.snp.bottom)
            make.width.equalTo(spView)
        }
        
        spView.layoutIfNeeded()
        
        let height = bounds.size.height
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransformMakeTranslation(0, -height)
        } completion: { _ in
            compelete()
        }

    }
    
    public func shouldHide(spView: UIView, compelete: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0.5) {
            self.transform = .identity
        } completion: { _ in
            compelete()
        }

    }
    
    
}

