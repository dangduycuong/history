//
//  BaseNavigationController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .white
        if let font = UIFont(name: "Menlo-Bold", size: 22) {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColor.blueCustom, NSAttributedString.Key.font: font]
        }
        navigationBar.tintColor = .white
    }
}
