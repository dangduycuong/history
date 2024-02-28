//
//  UIView+Extension.swift
//  history
//
//  Created by cuongdd on 27/02/2024.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.darkGray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 3)
            layer.shadowOpacity = 0.2
            layer.shadowRadius = newValue
        }
    }
}
