//
//  Storyboard+Extensions.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

extension UIStoryboard {
    
    class func storyBoard(_ storyboard: UIStoryboardType) -> UIStoryboard {
        return UIStoryboard(name: storyboard.identifier, bundle: nil)
    }
    
    func viewController<T: UIViewController>(of type: T.Type) -> T {
        guard let viewController =  instantiateViewController(withIdentifier: T.identifierView) as? T else {
            fatalError("Unabble to instantiate '\(T.identifierView)' ")
        }
        return viewController
    }
    
}

// MARK: Storyboard Type
enum UIStoryboardType {
    
    case main
    case dynasty
    case timeline
    case person
    case territory
    case stories
    
    var identifier: String {
        switch self {
        case .main:
            return "Main"
        case .dynasty:
            return "Dynasty"
        case .timeline:
            return "Timeline"
        case .person:
            return "Person"
        case .territory:
            return "Territory"
        case .stories:
            return "Stories"
        }
    }
}
