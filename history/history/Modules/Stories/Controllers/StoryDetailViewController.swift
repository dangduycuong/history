//
//  StoryDetailViewController.swift
//  history
//
//  Created by cuongdd on 26/02/2024.
//

import UIKit

class StoryDetailViewController: BaseViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var contentModel: ContentModel?
    
    override func loadView() {
        super.loadView()
        prepareForViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fillData()
    }
    
    private func prepareForViewController() {
        addBackground()
        addTitle(title: contentModel?.title)
        addBackButton()
        view.layout(scrollView)
            .below(titleLabel, 16)
            .left()
            .bottomSafe()
            .right()
        
        scrollView.layout(contentLabel)
            .top()
            .left(16)
            .bottom()
            .right(-16)
            .width(view.bounds.width - 32)
        
        let height = NSLayoutConstraint(item: contentLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        contentLabel.addConstraints([height])
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.numberOfLines = 0
    }
    
    private func fillData() {
        guard let content = contentModel?.content else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = .left
        
        let attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 21),
            .paragraphStyle: paragraphStyle
        ]
        contentLabel.attributedText = NSAttributedString(string: content, attributes: attributes)
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
