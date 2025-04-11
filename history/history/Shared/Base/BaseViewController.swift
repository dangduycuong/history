//
//  BaseViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit
import RxSwift
import Material

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
        let image = UIImage(resource: ImageResource.icons8Back).withRenderingMode(.alwaysTemplate)
        let backImageView = UIImageView()
        backImageView.image = image
        backImageView.tintColor = UIColor.black
        
        view.layout(backImageView)
            .topSafe()
            .left(16)
            .width(24)
            .height(24)
        
        view.layout(backButton)
            .center(backImageView)
            .width(40)
            .height(40)
    }
    
    func addBackground() {
        view.layout(backGroundImageView)
            .top()
            .left()
            .bottom()
            .right()
        let image = UIImage(resource: ImageResource.biaCatTong)
        backGroundImageView.image = image
    }
    
    func addTitle(title: String?) {
        view.layout(titleLabel)
            .topSafe()
            .centerX()
            .height(24)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
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
        let image = UIImage(resource: ImageResource.addToPhotos24Px).withRenderingMode(.alwaysTemplate)
        addDataImageView.image = image
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
