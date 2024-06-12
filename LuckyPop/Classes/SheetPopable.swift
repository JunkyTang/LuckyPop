//
//  PopAbleSheet.swift
//  LuckyPop
//
//  Created by junky on 2024/6/8.
//

import Foundation
import SnapKit


public protocol SheetPopable: Popable {
    
    var hLayout: Layout { get }
    
    var vLayout: Layout { get }
}

public extension SheetPopable {
    
    
    var hLayout: Layout {
        return .margin(0)
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
            make.top.equalTo(spView.snp.bottom)
            make.centerX.equalTo(spView)
        }
        
        spView.layoutIfNeeded()
        
        let height = bounds.size.height
        UIView.animate(withDuration: durationForShow) {
            self.transform = CGAffineTransformMakeTranslation(0, -height)
        }
    }
    
    func hideAnimation(spView: UIView, compelete: @escaping () -> Void) {
        
        UIView.animate(withDuration: durationForHide) {
            self.transform = .identity
        } completion: { finish in
            compelete()
        }

    }
    
}

