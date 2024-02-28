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

    override func loadView() {
        super.loadView()
        prepareForViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Triều đại
    }
    
    private func prepareForViewController() {
        navigationController?.navigationBar.isHidden = true
        addBackground()
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
