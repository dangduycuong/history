//
//  BaseViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    lazy var addDataImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var addDataButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addDataButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var backGroundImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    func addBackButton() {
        view.layout(backButton)
            .centerY(titleLabel)
            .left(16)
            .width(40)
            .height(40)
        let backImageView = UIImageView(image: R.image.icons8Back()?.withRenderingMode(.alwaysTemplate))
        backImageView.tintColor = UIColor.black
        
        backButton.layout(backImageView)
            .left()
            .centerY()
            .width(24)
            .height(24)
    }
    
    func addBackground() {
        view.layout(backGroundImageView)
            .top()
            .left()
            .bottom()
            .right()
        
        backGroundImageView.image = R.image.bia_cat_tong()
    }
    
    func addTitle(title: String?) {
        view.layout(titleLabel)
            .topSafe()
            .centerX()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        titleLabel.text = title
    }
    
    func addAddDataButton() {
        view.layout(addDataButton)
            .right(16)
            .bottomSafe(16)
            .width(40)
            .height(40)
        addDataButton.layer.borderWidth = 1
        addDataButton.layer.cornerRadius = 20
        
        addDataImageView = UIImageView(image: R.image.add_to_photos_24px()?.withRenderingMode(.alwaysTemplate))
        addDataImageView.tintColor = UIColor.black
        
        addDataButton.layout(addDataImageView)
            .center()
            .width(16)
            .height(16)
    }
    
    @objc func backButtonClicked(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addDataButtonClicked(sender: UIButton) {
    }
    
}
