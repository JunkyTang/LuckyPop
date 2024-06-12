//
//  TestView.swift
//  LuckyPop_Example
//
//  Created by junky on 2024/5/27.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import LuckyPop
import SnapKit

class TestView: UIView {

    static func loadFromXib(_ xibName: String? = nil) -> TestView {
        
        let bundle = Bundle(for: TestView.self)
        let name = xibName ?? String(describing: self)
        if let instance = bundle.loadNibNamed(name, owner: nil)?.first,
           let view = instance as? TestView {
            return view
        }
        return TestView()
    }

}

extension TestView: AlertPopable {}
