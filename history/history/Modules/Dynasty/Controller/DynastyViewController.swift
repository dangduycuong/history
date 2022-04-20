//
//  DynastyViewController.swift
//  history
//
//  Created by cuongdd on 20/04/2022.
//

import UIKit

class LabelInset: UILabel {
    var contentInset: UIEdgeInsets = .zero {
        didSet {
            setNeedsDisplay()
        }
    }
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInset))
    }
    
    override public var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + contentInset.left + contentInset.right, height: size.height + contentInset.top + contentInset.bottom)
    }
}

class DynastyViewController: BaseViewController {
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = LabelInset()
        label.font = UIFont(name: "Menlo-Regular", size: 20)
        label.textColor = AppColor.blueCustom
        label.textAlignment = .center
        label.contentInset = UIEdgeInsets(top: -12, left: 0, bottom: 0, right: 0)
        label.text = "Triều đại"
        label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
