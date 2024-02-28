//
//  Utils.swift
//  history
//
//  Created by cuongdd on 27/02/2024.
//

import UIKit
import SystemConfiguration

class Utils: NSObject {
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first?.rootViewController) -> UIViewController? {
            if let nav = base as? UINavigationController {
                return topViewController(nav.topViewController)
            }
            if let tab = base as? UITabBarController {
                if let selected = tab.selectedViewController {
                    return topViewController(selected)
                }
            }
            
            if let child = base?.children.last {
                return topViewController(child)
            }
            
            if let presented = base?.presentedViewController {
                return topViewController(presented)
            }
            return base
        }
    
    // MARK: - Hub
    
    class func showLoadingIndicator(_ message: String? = nil) {
        DispatchQueue.main.async {
            guard let topVC = Utils.topViewController() else { return }
            let vc = LoadingViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            topVC.present(vc, animated: true)
        }
    }
    
    class func showLoadingWhiteScreen() {
        DispatchQueue.main.async {
            
        }
    }
    
    class func hideLoadingIndicator() {
        DispatchQueue.main.async {
            guard let topVC = Utils.topViewController() as? LoadingViewController else { return }
            topVC.dismiss(animated: true)
        }
    }
    
    class func getDeviceID() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? "simulator"
    }
    
    class func open(url: String, completed: (() -> Void)? = nil, error: (() -> Void)? = nil) {
        if let url = URL(string: url),
           UIApplication.shared.canOpenURL(url) {
            DispatchQueue.main.async {
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    completed?()
                })
            }
        } else {
            error?()
        }
    }
}
