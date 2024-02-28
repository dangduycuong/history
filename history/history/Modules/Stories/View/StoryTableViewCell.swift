//
//  StoryTableViewCell.swift
//  history
//
//  Created by cuongdd on 27/02/2024.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    // Custom properties for your cell's UI elements
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialize UI elements and add them to the cell's content view
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize UI elements and add them to the cell's content view
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.shadowRadius = 3
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        // Add UI elements to the cell's content view
        self.layout(containerView)
            .top(8)
            .left(16)
            .bottom(8)
            .right(16)
            .height(64)
        
        containerView.layer.masksToBounds = true
        containerView.cornerRadius = 8
        containerView.backgroundColor = UIColor.white
        
        let vStackView = UIStackView()
        vStackView.axis = .vertical
        vStackView.alignment = .fill
        vStackView.distribution = .fill
        vStackView.spacing =  8
        
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(descriptionLabel)
        
        containerView.layout(vStackView)
            .centerY()
            .left(8)
            .right(8)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        descriptionLabel.font = UIFont.systemFont(ofSize: 21)
    }
    
    // MARK: - Configure Cell
    
    func configure(index: Int, title: String?, description: String?, searchText: String?, isSelecting: Bool?) {
        containerView.backgroundColor = isSelecting == true ? UIColor.secondaryLabel.withAlphaComponent(0.35) : UIColor.white
        // Configure UI elements with data
        descriptionLabel.text = description
        
        let string = "\(index + 1). \(title ?? "")"
        hilightText(searchText: searchText, content: string, label: titleLabel, color: UIColor.black, font: UIFont.boldSystemFont(ofSize: 21))
    }
    
    private func hilightText(searchText: String?, content: String?, label: UILabel, color: UIColor, font: UIFont?) {
        guard let content = content else { return }
        guard let keyWord = searchText else { return }
        let rangeContent = findRange(source: content , textToFind: keyWord.folded.lowercased())
        if rangeContent.location != NSNotFound {
            setColorTextLabel(string: content, range: rangeContent, label: label, color: color, font: font)
        } else {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 6
            paragraphStyle.alignment = .left
            let attributes: [NSAttributedString.Key : Any] = [
                .font: font as Any,
                .paragraphStyle: paragraphStyle,
                .foregroundColor: color
            ]
            
            label.attributedText = NSAttributedString(string: content, attributes: attributes)
        }
    }
    
    func findRange(source: String, textToFind: String) -> NSRange {
        let string = NSMutableAttributedString(string: source.folded.lowercased())
        
        let range = string.mutableString.range(of: textToFind.folded.lowercased(), options: .caseInsensitive)
        return range
    }
    
    func setColorTextLabel(string: String, range: NSRange, label: UILabel, color: UIColor, font: UIFont?) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineSpacing = 6
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: font as Any,
            .foregroundColor: color
        ]
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: string, attributes: attributes)
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: range)
        label.attributedText = myMutableString
    }
}
