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
    
    var durationForShow: TimeInterval { get }
    
    var durationForHide: TimeInterval { get }
    
    func showAnimation(spView: UIView)
    
    func hideAnimation(spView: UIView, compelete:@escaping () -> Void)
    
}

public extension Popable {
    
    
    var hideWhendTapMask: Bool {
        return true
    }
    
    var needMask: Bool {
        return true
    }
    
    var durationForShow: TimeInterval {
        return 0.2
    }
    
    var durationForHide: TimeInterval {
        return 0.2
    }
    
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
        showAnimation(spView: view)
    }
    
    func hide(_ compelete:(() -> Void)? = nil) {
        guard let spView = superview else { return }
        hideAnimation(spView: spView) {
            if let msk = spView as? MaskView {
                msk.removeFromSuperview()
            }else{
                spView.removeFromSuperview()
            }
            compelete?()
        }
    }
}
