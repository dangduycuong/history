//
//  UIView+Identifier.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

//
// MARK: - Default Implementation for Identifier
extension UIView: Identifier {
    
    /// ID View
    static var identifierView: String {
        get {
            return String(describing: self)
        }
    }
    
    /// XIB
    static func xib() -> UINib? {
        return UINib(nibName: self.identifierView, bundle: nil)
    }
    
    class func instanceFromXib() -> UIView? {
        return xib()?.instantiate(withOwner: nil, options: nil).first as? UIView
    }
}
