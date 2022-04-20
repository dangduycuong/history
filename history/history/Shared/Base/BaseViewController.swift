//
//  BaseViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit
import Material

class BaseViewController: UIViewController {
    
    var backButton: UIButton = {
        let originalImage = UIImage(named: R.image.icons8Back.name)
        let tintedImage = originalImage!.withRenderingMode(.alwaysTemplate)
        let button = IconButton(image: tintedImage, tintColor: AppColor.blueCustom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 11, right: 0)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    func addBackButton() {
        backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        let backBarButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backBarButton
    }
    
    @objc func backButtonClicked(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
