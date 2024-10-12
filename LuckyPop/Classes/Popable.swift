//
//  PopAble.swift
//  LuckyPop
//
//  Created by junky on 2024/5/25.
//

import UIKit


public protocol Popable: UIView {
    
    
    var hideWhendTapMask: Bool { get }
    
    var needMask: Bool { get }
    
    func shouldShow(spView: UIView, compelete: @escaping () -> Void)
    
    func shouldHide(spView: UIView,compelete: @escaping () -> Void)
}

public extension Popable {
    
    
    var hideWhendTapMask: Bool {
        return true
    }
    
    var needMask: Bool {
        return true
    }
    
    func shouldShow(spView: UIView, compelete: @escaping () -> Void) { compelete() }
    
    func shouldHide(spView: UIView,compelete: @escaping () -> Void) { compelete() }
    
}


public extension Popable {
    
    
    var maskView: UIButton {
        let mask = MaskView(frame: .zero)
        mask.backgroundColor = UIColor(white: 0, alpha: 0.5)
        mask.didClickSubject = { [weak self] in
            guard let weakSelf = self else { return }
            if !weakSelf.hideWhendTapMask {
                return
            }
            weakSelf.hide()
        }
        return mask
    }
    
    func show(_ inView: UIView? = nil) {
        
        let supView = inView ?? UIApplication.shared.currentWindow
        guard var view = supView else { return }
        
        if needMask {
            let msk = maskView
            view.addSubview(msk)
            msk.frame = view.bounds
            view = msk
        }
        
        view.addSubview(self)
        shouldShow(spView: view) {
            
        }
    }
    
    func hide(_ compelete:(() -> Void)? = nil) {
        guard let spView = superview else { return }
        shouldHide(spView: spView) {
            if let msk = spView as? MaskView {
                msk.removeFromSuperview()
            }else{
                spView.removeFromSuperview()
            }
            compelete?()
        }
    }
}
