//
//  MaskView.swift
//  LuckyPop
//
//  Created by junky on 2024/5/25.
//

import UIKit


public class MaskView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        backgroundColor = UIColor(white: 0, alpha: 0.3)
        addTarget(self, action: #selector(didClick), for: .touchUpInside)
    }
    
    
    var didClickSubject: () -> Void = {
        
    }
    
    
    @objc func didClick() {
        didClickSubject()
    }
    
}
