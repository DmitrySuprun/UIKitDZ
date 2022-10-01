//
//  Extension.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 28.09.22.
//

import UIKit

extension UITextField {
    
    func addUnderLine() {
            let underLine = CALayer()
            underLine.frame = CGRect(x: 0.0, y: self.bounds.height + 3, width: self.bounds.width, height: 1.5)
            underLine.backgroundColor = UIColor.systemGray4.cgColor
            self.layer.addSublayer(underLine)
        }
}
